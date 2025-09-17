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

ls.add_snippets("tex", {
	-- MATH snippets
	s({ trig = "\frac", dscr = "fraction" }, {
		t({ "\\frac{" }),
		i(1),
		t({ "}{" }),
		i(2),
		t({ "}" })
	}),

	-- TEXT snippets
	s({ trig = "\\ttt", dscr = "inline code text (monospaced)" }, {
		t({ "\\texttt{" }),
		i(1),
		t({ "}" })
	}),
	s({ trig = "\\bf", dscr = "bold text" }, {
		t({ "\\textbf{" }),
		i(1),
		t({ "}" })
	}),
	s({ trig = "\\it", dscr = "italic text" }, {
		t({ "\\textit{" }),
		i(1),
		t({ "}" })
	}),
	s({ trig = "eq", dscr = "equation" }, {
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

	-- LaTeX Beamer
	s({ trig = "frame", dscr = "Beamer frame" }, {
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
	s({ trig = "frame", name = "framebreak", dscr = "Beamer frame with framebreak" }, {
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
