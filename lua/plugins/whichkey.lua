local wk = require("which-key")

wk.register({
	f = {
		name = "Find",
		f = { "Find File" },
		b = { "Find Buffer" },
		h = { "Find Help" },
		w = { "Find Text" },
	},
	e = { "File Manager" },
	o = { "Git status" },
	b = {
		name = "Buffer",
		x = "Close buffer",
		X = "Close Right Buffer",
		s = "Sort",
	},
	w = { "Save" },
	h = { "No highlight" },
	g = { name = "Git", b = "Branches", c = "Commits", s = "Status", d = "Diff" },
	c = { name = "Comment", l = "Comment Line" },
	l = {
		name = "LSP",
		d = "Diagnostic",
		D = "Hover diagnostic",
		f = "Format",
		r = "Rename",
		a = "Action",
		s = "Symbol",
        h = "Highlight"
	},
}, { prefix = "<leader>" })

wk.register({
	d = { "Go to Definition" },
	r = { "Go to References" },
}, { prefix = "g" })
