require("luasnip.session.snippet_collection").clear_snippets "go"

local ts_locals = require "nvim-treesitter.locals"
local ts_utils = require "nvim-treesitter.ts_utils"

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")

local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda

local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix

local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

-------------------------------------------------------------------------------
-- Imports end
-------------------------------------------------------------------------------

---@param pos integer
local function make_eni(pos)
    return sn(pos,fmta(
        [[
            if err != nil {
                return <result>,err
            }<finish>
        ]],
        {
            result = i(1),
            finish = i(0),
        }
    ))
end

local efi = sn(1, fmta(
    [[
        <val>, err := <f>(<args>)
        <if_err_nil><finish>
    ]],
    {
        val = i(1, "_"),
        f = i(2),
        args = i(3),
        if_err_nil = make_eni(4),
        finish = i(0),
    }
))

ls.add_snippets("go", {
    s("eni", make_eni(1)),
    s("efi", efi),
})

