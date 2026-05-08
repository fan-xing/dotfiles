local config = require("leetcode.config")
local Path = require("plenary.path")

local M = {}

function M.plans_dir()
    return Path:new(config.storage.home:absolute() .. "/plans")
end

function M.list_plans()
    local dir = M.plans_dir()
    if not dir:exists() then
        return {}
    end

    local plans = {}
    local scan = require("plenary.scandir")
    local files = scan.scan_dir(dir:absolute(), { depth = 1 })

    for _, f in ipairs(files) do
        local name = vim.fn.fnamemodify(f, ":t:r")
        table.insert(plans, { name = name, path = f })
    end

    table.sort(plans, function(a, b)
        return a.name < b.name
    end)
    return plans
end

function M.load_plan(path)
    local p = Path:new(path)
    if not p:exists() then
        return {}
    end

    local ids = {}
    local content = p:read()
    for line in content:gmatch("[^\r\n]+") do
        local id = line:match("^%s*%-?%s*%[.%]%s*(%d+)")
            or line:match("^%s*%-?%s*(%d+)")
        if id then
            table.insert(ids, id)
        end
    end
    return ids
end

function M.get_plan_problems(path)
    local ids = M.load_plan(path)
    local problemlist = require("leetcode.cache.problemlist")
    local all = problemlist.get()

    local id_map = {}
    for _, item in ipairs(all) do
        id_map[tostring(item.frontend_id)] = item
    end

    local result = {}
    for _, id in ipairs(ids) do
        local item = id_map[id]
        if item then
            table.insert(result, item)
        end
    end
    return result
end

function M.refresh_status(items)
    local problemlist = require("leetcode.cache.problemlist")
    local all = problemlist.get()

    local id_map = {}
    for _, p in ipairs(all) do
        id_map[tostring(p.frontend_id)] = p
    end

    for i, item in ipairs(items) do
        local fresh = id_map[tostring(item.frontend_id)]
        if fresh then
            items[i] = fresh
        end
    end
    return items
end

return M
