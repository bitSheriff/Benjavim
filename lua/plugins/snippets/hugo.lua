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

-- HUGO markdown

ls.add_snippets("markdown", {
    s("hugo comment", {
        t({ "<!--" }),
        i(1),
        t({ "-->" }),
    }),
})

ls.add_snippets("markdown", {
    s("hugo github repo", {
        t({ '{{< github repo="NAME/REPO" >}}' }),
    }),
})

ls.add_snippets("markdown", {
    s("hugo alert generic", {
        t({ '{{< alert icon="fire" cardColor="#e63946" iconColor="#1d3557" textColor="#f1faee" >}}', "" }),
        i(1),
        t({ "", "{{< /alert >}}" }),
    }),
})

ls.add_snippets("markdown", {
    s("hugo article post", {
        t({ '{{< article link="/docs/welcome/" >}}' }),
    }),
})

ls.add_snippets("markdown", {
    s("hugo figure", {
        t({
            "{{< figure",
            '    src="abstract.jpg"',
            '    alt="Abstract purple artwork"',
            '    caption="Photo by [Jr Korpa](https://unsplash.com/@jrkorpa) on [Unsplash](https://unsplash.com/)"',
            ">}}",
        }),
    }),
})

ls.add_snippets("markdown", {
    s("hugo keyword", {
        t({ "{{< keyword >}} *Super* skill {{< /keyword >}}" }),
    }),
})

ls.add_snippets("markdown", {
    s("hugo keyword icon", {
        t({ '{{< keyword icon="github" >}} Lorem ipsum dolor. {{< /keyword >}}' }),
    }),
})

ls.add_snippets("markdown", {
    s("hugo mermaid", {
        t({ "{{< mermaid >}}", "" }),
        i(1),
        t({ "", "{{< /mermaid >}}" }),
    }),
})
