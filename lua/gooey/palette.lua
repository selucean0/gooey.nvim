local M = {}

M.colors = {
	black = "#000009", -- Gooey: Black (Host)
	black1 = "#1F222D", -- Gooey: Bright Black
	black2 = "#1F222D", -- Gooey: Bright Black
	black3 = "#1F222D", -- Gooey: Bright Black

	white3 = "#C0B7F9", -- Gooey: Bright Cyan
	white2 = "#EBEEF9", -- Gooey: Foreground (Text)
	white1 = "#EBEEF9", -- Gooey: Foreground (Text)
	white = "#FFFFFF", -- Gooey: Bright White

	ivory2 = "#EBEEF9", -- Gooey: Foreground (Text)
	purple6 = "#6488C4", -- Gooey: Magenta (Syntax var)
}

-- dark
M.themes = {
	primary = "#72CCAE",           -- Gooey: Green (Command)

	foreground = "#EBEEF9",        -- Gooey: Foreground (Text)
	activeForeground = "#C0B7F9",  -- Gooey: Bright Cyan
	secondaryForeground = "#858893", -- Gooey: White
	ignored = "#1F222D",           -- Gooey: Bright Black
	border = "#FFFFFF",            -- Gooey: Bright White

	background = "#0D101B",        -- Gooey: Background
	activeBackground = "#1F222D",  -- Gooey: Bright Black

	lowBackground = "#0D101B",     -- Gooey: Background
	lowActiveBackground = "#1F222D", -- Gooey: Bright Black
	lowBorder = "#FFFFFF",         -- Gooey: Bright White

	comment = "#8D84C6",           -- Gooey: Cyan (Prompt)
	string = "#BB4F6C",            -- Gooey: Red (Syntax string)
	variable = "#C65E3D",          -- Gooey: Yellow (Command second)
	keyword = "#72CCAE",           -- Gooey: Green (Command)
	number = "#58B6CA",            -- Gooey: Blue (Path)
	boolean = "#72CCAE",           -- Gooey: Green (Command)
	operator = "#EE829F",          -- Gooey: Bright Red (Command error)
	func = "#A5FFE1",              -- Gooey: Bright Green (Exec)
	constant = "#F99170",          -- Gooey: Bright Yellow
	class = "#58B6CA",             -- Gooey: Blue (Path)
	interface = "#72CCAE",         -- Gooey: Green (Command)
	type = "#8BE9FD",              -- Gooey: Bright Blue (Folder)
	builtin = "#EE829F",           -- Gooey: Bright Red (Command error)
	property = "#97BBF7",          -- Gooey: Bright Magenta
	namespace = "#C0B7F9",         -- Gooey: Bright Cyan
	punctuation = "#858893",       -- Gooey: White
	decorator = "#C65E3D",         -- Gooey: Yellow (Command second)
	regex = "#C65E3D",             -- Gooey: Yellow (Command second)

	-- colors
	green = "#72CCAE", -- Gooey: Green (Command)
	cyan = "#8D84C6",  -- Gooey: Cyan (Prompt)
	blue = "#58B6CA",  -- Gooey: Blue (Path)
	red = "#BB4F6C",   -- Gooey: Red (Syntax string)
	orange = "#C65E3D", -- Gooey: Yellow (Command second)
	yellow = "#F99170", -- Gooey: Bright Yellow
	magenta = "#6488C4", -- Gooey: Magenta (Syntax var)
}

return M

