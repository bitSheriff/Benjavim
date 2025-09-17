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

---
-- MATH snippets
---

-- snippet for fraction
ls.add_snippets("tex", {
    s("\\frac", {
        t({ "\\frac{" }),
        i(1),
        t({ "}{" }),
        i(2),
        t({ "}" }),
    }),
})

---
-- TEXT snippets
---

-- snippet for inline code text (monospaced)
ls.add_snippets("tex", {
    s("\\ttt", {
        t({ "\\texttt{" }),
        i(1),
        t({ "}" }),
    }),
})

-- snippet for bold text
ls.add_snippets("tex", {
    s("\\bf", {
        t({ "\\textbf{" }),
        i(1),
        t({ "}" }),
    }),
})

-- snippet for italic text
ls.add_snippets("tex", {
    s("\\it", {
        t({ "\\textit{" }),
        i(1),
        t({ "}" }),
    }),
})

-- equation
ls.add_snippets("tex", {
    s("eq", {
        t({ -- using a table of strings for multiline text
            "\\begin{equation}",
            "    ",
        }),
        i(1),
        t({
            "",
            "\\end{equation}",
        }),
    }),
})
---
-- LaTeX Beamer
--
ls.add_snippets("tex", {
    s("frame", {
        t({ -- using a table of strings for multiline text
            "\\begin{frame}{}",
            "    ",
        }),
        i(1),
        t({
            "",
            "\\end{frame}",
        }),
    }),
})

-- Frame with Framebreak
ls.add_snippets("tex", {
    s("frame", {
        t({ -- using a table of strings for multiline text
            "\\begin{frame}[allowframebreaks]{}",
            "    ",
            "    \\framebreak",
        }),
        i(1),
        t({
            "",
            "\\end{frame}",
        }),
    }),
})
