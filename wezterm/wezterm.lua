local wezterm = require("wezterm")

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "carbonfox"
	else
		return "carbonfox"
		-- return "dayfox"
	end
end

local config = {
	-- 设置窗口无边框
	window_decorations = "RESIZE",
	-- 隐藏标签栏
	enable_tab_bar = false,

	-- 设置字体和字体大小
	-- font = wezterm.font("Fira Code"),
	font = wezterm.font("Maple Mono NF"),
	font_size = 12.0,

	-- macos_window_background_blur = 50,
	-- window_background_opacity = 0.7,

	-- color_scheme = "Modus-Vivendi",
	color_scheme = "Chalkboard",
	-- color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),

	enable_kitty_graphics = true,
}
config.initial_rows = 30
config.initial_cols = 120
config.line_height = 1.5

config.window_padding = {
	left = 40,
	right = 40,
	top = 30,
	bottom = 0,
}
-- config.use_resize_increments = true
-- config.max_fps = 120
return config
