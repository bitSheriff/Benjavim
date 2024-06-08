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
require("custom.plugins.snippets.markdown")
require("custom.plugins.snippets.tex")
require("custom.plugins.snippets.c")
require("custom.plugins.snippets.python")


-- i dont know if this is needed
ls.filetype_extend("cpp", { "c" })
ls.filetype_extend("h", { "c" })
ls.filetype_extend("tex", { "latex", "tex" })
ls.filetype_extend("tex", { "plaintex", "latex", "tex" })
ls.filetype_extend("plaintex", { "plaintex", "latex", "tex" })
ls.filetype_extend("python", { "py", })

--
-- FUNCTIONS
--
local date = function()
  return { os.date "%Y-%m-%d" }
end

local time = function()
  return { os.date "%H:%m" }
end
-- -------------------
-- SNIPPETS
-- -------------------

-- stupid snippet for testing
ls.add_snippets("all", {
  s("blub", { t("BliBlaBlub") })
})

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
