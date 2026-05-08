return function()
    local cmd = require("leetcode.command")
    local log = require("leetcode.logger")
    local utils = require("leetcode.utils")
    local config = require("leetcode.config")
    local Question = require("leetcode-ui.question")
    local Path = require("plenary.path")

    local state = {
        items = {},
        index = 0,
        plan_name = "",
    }

    local function state_file()
        return Path:new(config.storage.home:absolute() .. "/plans/.state.json")
    end

    local function save_state()
        if state.plan_name == "" then return end
        local f = state_file()
        local data = {}
        if f:exists() then
            local ok, parsed = pcall(vim.json.decode, f:read())
            if ok and type(parsed) == "table" then data = parsed end
        end
        data[state.plan_name] = state.index
        f:write(vim.json.encode(data), "w")
    end

    local function load_index(name)
        local f = state_file()
        if not f:exists() then return 1 end
        local ok, data = pcall(vim.json.decode, f:read())
        if ok and type(data) == "table" and data[name] then
            return data[name]
        end
        return 1
    end

    local function title(item)
        return item.title_cn ~= "" and item.title_cn or item.title
    end

    local function status_icon(item)
        if item.status == "ac" then return "✓"
        elseif item.status == "notac" then return "✗"
        else return " " end
    end

    local function count_ac(items)
        local n = 0
        for _, item in ipairs(items) do
            if item.status == "ac" then n = n + 1 end
        end
        return n
    end

    local function open_at(idx)
        if idx < 1 or idx > #state.items then
            return log.warn(("No more problems (%d/%d)"):format(idx, #state.items))
        end
        state.index = idx
        save_state()
        local item = state.items[idx]
        log.info(("[%d/%d] %s %s. %s"):format(idx, #state.items, status_icon(item), item.frontend_id, title(item)))
        Question(item):mount()
    end

    function cmd.plan_select()
        utils.auth_guard()
        local plan_mod = require("leetcode-plan")
        local plans = plan_mod.list_plans()
        if vim.tbl_isempty(plans) then
            return log.warn("No plans found in plans/ directory")
        end
        vim.ui.select(plans, {
            prompt = "Select a Plan",
            format_item = function(item)
                local problems = plan_mod.get_plan_problems(item.path)
                local ac = count_ac(problems)
                return item.name .. "  " .. ac .. "/" .. #problems
            end,
        }, function(choice)
            if choice then
                cmd.plan_open(choice.path, choice.name)
            end
        end)
    end

    function cmd.plan_open(path, name)
        utils.auth_guard()
        local plan_mod = require("leetcode-plan")
        local items = plan_mod.get_plan_problems(path)
        if vim.tbl_isempty(items) then
            return log.warn("No problems found in plan")
        end
        state.items = items
        state.plan_name = name or ""
        local idx = load_index(state.plan_name)
        if idx > #items then idx = #items end
        open_at(idx)
    end

    function cmd.plan_next()
        if vim.tbl_isempty(state.items) then
            return log.warn("No active plan. Use :Leet plan first")
        end
        open_at(state.index + 1)
    end

    function cmd.plan_prev()
        if vim.tbl_isempty(state.items) then
            return log.warn("No active plan. Use :Leet plan first")
        end
        open_at(state.index - 1)
    end

    function cmd.plan_progress()
        if vim.tbl_isempty(state.items) then
            return log.warn("No active plan. Use :Leet plan first")
        end
        local plan_mod = require("leetcode-plan")
        state.items = plan_mod.refresh_status(state.items)
        local lines = { state.plan_name .. " Progress:", "" }
        for i, item in ipairs(state.items) do
            local mark = status_icon(item)
            local current = i == state.index and " ←" or ""
            table.insert(lines, ("[%s] %s. %s%s"):format(mark, item.frontend_id, title(item), current))
        end
        table.insert(lines, "")
        table.insert(lines, count_ac(state.items) .. "/" .. #state.items .. " completed")
        log.info(table.concat(lines, "\n"))
    end

    cmd.commands.plan = { cmd.plan_select }
    cmd.commands.next = { cmd.plan_next }
    cmd.commands.prev = { cmd.plan_prev }
    cmd.commands.progress = { cmd.plan_progress }

    -- patch problems page
    package.loaded["leetcode-ui.group.page.problems"] = nil
    package.preload["leetcode-ui.group.page.problems"] = function()
        local lc_cmd = require("leetcode.command")
        local Title = require("leetcode-ui.lines.title")
        local Button = require("leetcode-ui.lines.button.menu")
        local BackButton = require("leetcode-ui.lines.button.menu.back")
        local Buttons = require("leetcode-ui.group.buttons.menu")
        local Page = require("leetcode-ui.group.page")
        local footer = require("leetcode-ui.lines.footer")
        local header = require("leetcode-ui.lines.menu-header")

        local page = Page()
        page:insert(header)
        page:insert(Title({ "Menu" }, "Problems"))

        page:insert(Buttons({
            Button("List", { icon = "", sc = "p", on_press = lc_cmd.problems }),
            Button("Plan", { icon = "󰙒", sc = "l", on_press = lc_cmd.plan_select }),
            Button("Random", { icon = "", sc = "r", on_press = lc_cmd.random_question }),
            Button("Daily", { icon = "󰃭", sc = "d", on_press = lc_cmd.qot }),
            BackButton("menu"),
        }))

        page:insert(footer)
        return page
    end
end
