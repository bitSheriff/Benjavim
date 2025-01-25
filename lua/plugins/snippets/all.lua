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

-- require and load all the other snippets
require("plugins.snippets.markdown")
require("plugins.snippets.tex")
require("plugins.snippets.c")
require("plugins.snippets.python")
require("plugins.snippets.rust")
require("plugins.snippets.vhdl")
require("plugins.snippets.shell")
require("plugins.snippets.hugo")

-- i dont know if this is needed
ls.filetype_extend("cpp", { "c" })
ls.filetype_extend("h", { "c" })
ls.filetype_extend("tex", { "latex", "tex" })
ls.filetype_extend("tex", { "plaintex", "latex", "tex" })
ls.filetype_extend("plaintex", { "plaintex", "latex", "tex" })
ls.filetype_extend("python", { "py", "ipynb" })
ls.filetype_extend("rust", { "rs" })
ls.filetype_extend("vhdl", { "vhd" })
ls.filetype_extend("shell", { "sh", "bash" })

--
-- FUNCTIONS
--
local date = function()
    return { os.date("%Y-%m-%d") }
end

local time = function()
    return { os.date("%H:%m") }
end
-- -------------------
-- SNIPPETS
-- -------------------

-- insert time
ls.add_snippets(nil, {
    all = {
        s({
            trig = "time",
            namr = "Time",
            dscr = "Time in the form of HH:mm",
        }, {
            f(time, {}),
        }),
    },
})

-- insert date
ls.add_snippets(nil, {
    all = {
        s({
            trig = "date",
            namr = "Date",
            dscr = "Date in the form of YYYY-MM-DD",
        }, {
            f(date, {}),
        }),
    },
})
