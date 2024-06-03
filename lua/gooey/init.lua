local gooey_colors = require("gooey.palette").colors
local gooey_themes = require("gooey.palette").themes

local cmd = vim.cmd
local fn = vim.fn

-- merged opts, defaults <- user_opts
local opts = {}
local defaults = {
	comment_italics = true,
	transparent_background = true,
	transparent_float_background = true,
	reverse_visual = false,
	dim_nc = false,
	cmp_cmdline_disable_search_highlight_group = false,
	telescope_border_follow_float_background = false,
	lspsaga_border_follow_float_background = false,
	diagnostic_virtual_text_background = false,
	colors = {}, -- override `gooey_colors`
	themes = {}, -- override `gooey_themes`
}

local M = {
	Color = require("colorbuddy.init").Color,
	colors = require("colorbuddy.init").colors,
	Group = require("colorbuddy.init").Group,
	groups = require("colorbuddy.init").groups,
	styles = require("colorbuddy.init").styles,
}

function M.setup(user_opts)
	user_opts = user_opts or {}
	opts = vim.tbl_extend("force", defaults, user_opts)
	gooey_colors = vim.tbl_extend("force", gooey_colors, opts.colors)
	gooey_themes = vim.tbl_extend("force", gooey_themes, opts.themes)
end

function M.load()
	-- only needed to clear when not the default colorscheme
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	if fn.exists("syntax_on") then
		cmd("syntax reset")
	end

	vim.g.colors_name = "gooey"

	local Color = M.Color
	local colors = M.colors
	local Group = M.Group
	local groups = M.groups
	local styles = M.styles

	Color.new("bg", gooey_themes.background)

	Color.new("black", gooey_colors.black)
	Color.new("black1", gooey_colors.black1)
	Color.new("black2", gooey_colors.black2)
	Color.new("black3", gooey_colors.black3)
	Color.new("white3", gooey_colors.white3)
	Color.new("white2", gooey_colors.white2)
	Color.new("white1", gooey_colors.white1)
	Color.new("white", gooey_colors.white)
	Color.new("purple6", gooey_colors.purple6)

	Color.new("primary", gooey_themes.primary)

	Color.new("baseForeground", gooey_themes.foreground)
	Color.new("activeForeground", gooey_themes.activeForeground)
	Color.new("secondaryForeground", gooey_themes.secondaryForeground)
	Color.new("ignored", gooey_themes.ignored)
	Color.new("border", gooey_themes.border)

	Color.new("baseBackground", gooey_themes.background)
	Color.new("activeBackground", gooey_themes.activeBackground)

	Color.new("lowBackground", gooey_themes.lowBackground)
	Color.new("lowActiveBackground", gooey_themes.lowActiveBackground)
	Color.new("lowBorder", gooey_themes.lowBorder)

	Color.new("comment", gooey_themes.comment)
	Color.new("string", gooey_themes.string)
	Color.new("variable", gooey_themes.variable)
	Color.new("keyword", gooey_themes.keyword)
	Color.new("number", gooey_themes.number)
	Color.new("boolean", gooey_themes.boolean)
	Color.new("operator", gooey_themes.operator)
	Color.new("func", gooey_themes.func)
	Color.new("constant", gooey_themes.constant)
	Color.new("class", gooey_themes.class)
	Color.new("interface", gooey_themes.interface)
	Color.new("type", gooey_themes.type)
	Color.new("builtin", gooey_themes.builtin)
	Color.new("property", gooey_themes.property)
	Color.new("namespace", gooey_themes.namespace)
	Color.new("punctuation", gooey_themes.punctuation)
	Color.new("decorator", gooey_themes.decorator)
	Color.new("regex", gooey_themes.regex)

	Group.new("Comment", colors.comment, colors.none, opts.comment_italics and styles.italic or styles.NONE)
	Group.new("String", colors.string)
	Group.new("Variable", colors.variable)
	Group.new("Keyword", colors.keyword)
	Group.new("Number", colors.number)
	Group.new("Boolean", colors.boolean)
	Group.new("Operator", colors.operator)
	Group.new("Function", colors.func)
	Group.new("Constant", colors.constant)
	Group.new("Class", colors.class)
	Group.new("Interface", colors.interface)
	Group.new("Type", colors.type)
	Group.new("Builtin", colors.builtin)
	Group.new("Property", colors.property)
	Group.new("Namespace", colors.namespace)
	Group.new("Punctuation", colors.punctuation)
	Group.new("Decorator", colors.decorator)
	Group.new("Regex", colors.regex)

	Color.new("green", gooey_themes.green)
	Color.new("cyan", gooey_themes.cyan)
	Color.new("blue", gooey_themes.blue)
	Color.new("red", gooey_themes.red)
	Color.new("orange", gooey_themes.orange)
	Color.new("yellow", gooey_themes.yellow)
	Color.new("magenta", gooey_themes.magenta)

	Color.new("Error", gooey_themes.red)
	Color.new("Warn", gooey_themes.yellow)
	Color.new("Info", gooey_themes.blue)
	Color.new("Hint", gooey_themes.cyan)

	Group.new("Error", colors.Error)
	Group.new("Warn", colors.Warn)
	Group.new("Info", colors.Info)
	Group.new("Hint", colors.Hint)

	local normal = {
		fg = colors.baseForeground,
		bg = colors.baseBackground,
		nc_fg = colors.baseForeground,
		float_bg = colors.lowBackgroundContrast,
	}

	if opts.transparent_background then
		normal.bg = nil
	end
	if opts.transparent_float_background then
		normal.float_bg = nil
	end
	if opts.dim_nc then
		normal.nc_fg = colors.secondaryForeground
	end
	Group.new("Normal", normal.fg, normal.bg)
	-- normal non-current text, means non-focus window text
	Group.new("NormalNC", normal.nc_fg, normal.bg)
	Group.new("NormalFloat", groups.Normal, normal.float_bg)

	-- pum (popup menu) float
	Group.link("Pmenu", groups.NormalFloat)                                 -- popup menu normal item
	Group.new("PmenuSel", colors.activeBackground, normal.fg, styles.reverse) -- selected item
	Group.new("PmenuSbar", colors.black1, colors.none, styles.reverse)
	Group.new("PmenuThumb", colors.black2, colors.none, styles.reverse)

	-- be nice for this float border to be cyan if active
	-- https://neovim.io/doc/user/news-0.10.html#_-breaking-changes
	Group.link("FloatBorder", groups.NormalFloat)

	Group.new("LineNr", colors.ignored:light():light(), colors.none, styles.NONE)
	Group.new("CursorLine", colors.none, colors.lowActiveBackground, styles.NONE)
	Group.new("CursorLineNr", colors.activeForeground, colors.none, styles.NONE)
	Group.new("Cursor", colors.black3, colors.secondaryForeground, styles.NONE)
	Group.link("lCursor", groups.Cursor)
	Group.link("TermCursor", groups.Cursor)
	Group.new("TermCursorNC", colors.black3, colors.activeBackground)

	Group.link("Identifier", groups.Property)

	-- any statement, conditional, repeat (for, do while), label, operator
	Group.new("Statement", colors.green)
	Group.new("PreProc", colors.red)    -- was orange
	Group.new("Special", colors.property) -- was red
	Group.new("SpecialKey", colors.property)
	Group.new("Underlined", colors.red)
	Group.new("Strikethrough", colors.activeBackground, colors.none, styles.strikethrough)
	Group.new("Ignore", groups.Comment)
	Group.new("Todo", colors.blue)

	Group.link("Include", groups.PreProc)
	Group.link("Macro", groups.PreProc)
	Group.link("Delimiter", groups.Special)
	Group.link("Repeat", groups.Statement)
	Group.link("Conditional", groups.Statement)
	Group.link("Define", groups.PreProc)
	Group.link("Character", groups.Constant)
	Group.link("Float", groups.Constant)
	Group.link("Debug", groups.Special)
	Group.link("Label", groups.Statement)
	Group.link("Exception", groups.Statement)
	Group.link("StorageClass", groups.Type)

	Group.link("SpecialChar", groups.Special)
	Group.new("SpecialKey", colors.black3, colors.black1, styles.bold)
	Group.link("String", groups.String)
	Group.new("NonText", colors.black3, colors.none, styles.bold)
	Group.new("StatusLine", colors.lowBackground, colors.black1, styles.reverse)
	Group.new("StatusLineNC", colors.lowActiveBackground, colors.black1, styles.reverse)
	Group.new("Visual", colors.none, colors.black3, opts.reverse_visual and styles.reverse or styles.none)
	Group.new("Directory", colors.blue)
	Group.new("ErrorMsg", colors.red, colors.none, styles.reverse)

	Group.new("IncSearch", colors.orange, colors.none, styles.standout)
	Group.new("Search", colors.yellow, colors.none, styles.reverse)

	Group.new("MoreMsg", colors.blue, colors.none, styles.NONE)
	Group.new("ModeMsg", colors.blue, colors.none, styles.NONE)
	Group.new("Question", colors.cyan, colors.none, styles.bold)
	Group.new("VertSplit", colors.black3, colors.none, styles.NONE)
	Group.new("Title", colors.orange, colors.none, styles.bold)
	Group.new("VisualNOS", colors.none, colors.black1, styles.reverse)
	Group.new("WarningMsg", groups.Warn)
	Group.new("WildMenu", colors.baseForeground, colors.black1, styles.reverse)
	Group.new("Folded", colors.secondaryForeground, colors.black1, styles.bold, colors.black3)
	Group.new("FoldColumn", colors.secondaryForeground, colors.black1)

	Group.new("SignColumn", colors.secondaryForeground, colors.none, styles.NONE)
	Group.new("Conceal", colors.blue, colors.none, styles.NONE)

	Group.new("SpellBad", colors.none, colors.none, styles.undercurl, colors.red)
	Group.new("SpellCap", colors.none, colors.none, styles.undercurl, colors.purple6)
	Group.new("SpellRare", colors.none, colors.none, styles.undercurl, colors.cyan)
	Group.new("SpellLocal", colors.none, colors.none, styles.undercurl, colors.yellow)

	Group.new("MatchParen", colors.red, colors.activeBackground, styles.bold)

	-- vim highlighting
	Group.link("vimVar", groups.Identifier)
	Group.link("vimFunc", groups.Identifier)
	Group.link("vimUserFunc", groups.Identifier)
	Group.link("helpSpecial", groups.Special)
	Group.link("vimSet", groups.Normal)
	Group.link("vimSetEqual", groups.Normal)
	Group.new("vimCommentString", colors.purple6)
	Group.new("vimCommand", colors.yellow)
	Group.new("vimCmdSep", colors.blue, colors.NONE, styles.bold)
	Group.new("helpExample", colors.baseForeground)
	Group.new("helpOption", colors.cyan)
	Group.new("helpNote", colors.magenta)
	Group.new("helpVim", colors.magenta)
	Group.new("helpHyperTextJump", colors.blue, colors.NONE, styles.underline)
	Group.new("helpHyperTextEntry", colors.green)
	Group.new("vimIsCommand", colors.black3)
	Group.new("vimSynMtchOpt", colors.yellow)
	Group.new("vimSynType", colors.cyan)
	Group.new("vimHiLink", colors.blue)
	Group.new("vimGroup", colors.blue, colors.NONE, styles.underline + styles.bold)

	-- diff
	Group.new("DiffAdd", colors.green, colors.none, styles.bold, colors.green)
	Group.new("DiffChange", colors.orange, colors.none, styles.bold, colors.orange)
	Group.new("DiffDelete", colors.red, colors.none, styles.bold, colors.red)
	Group.new("DiffText", colors.blue, colors.none, styles.bold, colors.blue)

	-- alias ui
	Group.new("Folder", colors.orange)
	Group.new("FolderRoot", colors.blue)

	-- plugins

	-- treesitter, important
	require("gooey.plugins.treesitter")(opts)
	-- lsp
	require("gooey.plugins.lsp")(opts)
	-- neomake
	require("gooey.plugins.neomake")
	-- gitgutter
	require("gooey.plugins.gitgutter")
	-- gitsigns
	require("gooey.plugins.gitsigns")
	-- cmp
	require("gooey.plugins.cmp")(opts)
	-- lspsaga
	require("gooey.plugins.lspsaga")(opts, { normal = normal })
	-- telescope
	require("gooey.plugins.telescope")(opts, { normal = normal })
	-- neogit
	require("gooey.plugins.neogit")(opts)
	-- Primeagen/harpoon
	require("gooey.plugins.harpoon")
	-- nvim-tree/nvim-tree.lua
	require("gooey.plugins.nvim-tree")
	-- phaazon/hop.nvim
	require("gooey.plugins.hop")
	-- j-hui/fidget
	require("gooey.plugins.fidget")
	-- lukas-reineke/indent-blankline.nvim
	require("gooey.plugins.indent-blankline")
	-- folke/which-key.nvim
	require("gooey.plugins.which-key")
	-- folke/noice.nvim
	require("gooey.plugins.noice")(opts, { normal = normal })
	-- neo-tree
	require("gooey.plugins.neo-tree")(opts)
	-- alpha
	require("gooey.plugins.alpha")(opts)
	-- echasnovski/mini.indentscope
	require("gooey.plugins.mini-indentscope")(opts)
	-- vim-illuminate
	require("gooey.plugins.illuminate")(opts)
	-- seblj/nvim-tabline
	require("gooey.plugins.tabline")(opts, { normal = normal })

	return M
end

return M
