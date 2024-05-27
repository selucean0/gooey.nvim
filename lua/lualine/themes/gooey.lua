local gooey_theme = require("gooey.palette").themes

local gooey = {}

gooey.normal = {
	a = { bg = gooey_theme.primary, fg = gooey_theme.activeBackground },
	b = { bg = gooey_theme.lowActiveBackground, fg = gooey_theme.primary },
	c = { bg = gooey_theme.activeBackground, fg = gooey_theme.activeForeground },
}

gooey.insert = {
	a = { bg = gooey_theme.variable, fg = gooey_theme.activeBackground },
	b = { bg = gooey_theme.lowActiveBackground, fg = gooey_theme.variable },
}

gooey.command = {
	a = { bg = gooey_theme.yellow, fg = gooey_theme.activeBackground },
	b = { bg = gooey_theme.lowActiveBackground, fg = gooey_theme.yellow },
}

gooey.visual = {
	a = { bg = gooey_theme.magenta, fg = gooey_theme.activeBackground },
	b = { bg = gooey_theme.lowActiveBackground, fg = gooey_theme.magenta },
}

gooey.replace = {
	a = { bg = gooey_theme.red, fg = gooey_theme.activeBackground },
	b = { bg = gooey_theme.lowActiveBackground, fg = gooey_theme.red },
}

gooey.terminal = {
	a = { bg = gooey_theme.blue, fg = gooey_theme.activeBackground },
	b = { bg = gooey_theme.lowActiveBackground, fg = gooey_theme.blue },
}

gooey.inactive = {
	a = { bg = gooey_theme.lowBackground, fg = gooey_theme.ignored },
	b = { bg = gooey_theme.lowActiveBackground, fg = gooey_theme.ignored },
	c = { bg = gooey_theme.background, fg = gooey_theme.ignored },
}

return gooey
