--[[
-- lut.lua -- lut theme for vis
--
-- Change colors using the S table for syntax and U for UI
--
-- By Mario Rosell, under the CC0
--
--]]

local lexers = vis.lexers

local function is_color(v)
	return type(v) == "string"
end

local function style(fg, bg)
	return setmetatable({ fg = fg, bg = bg }, {
		__index = {
			bold = function(self)
				self._bold = true
				return self
			end,
			italic = function(self)
				self._italic = true
				return self
			end,
		},
		__tostring = function(t)
			local parts = {}

			if is_color(t.fg) then table.insert(parts, "fore:" .. t.fg) end
			if is_color(t.bg) then table.insert(parts, "back:" .. t.bg) end
			if t._bold then table.insert(parts, "bold") end
			if t._italic then table.insert(parts, "italics") end

			return table.concat(parts, ",")
		end,
	})
end

local function bg(c) return style(nil, c) end

local function apply(lx, t)
	for k, v in pairs(t) do
		lx[k] = tostring(v)
	end
end

local S = {
	red    = '#ff8080',
	orange = '#ffa860',
	yellow = '#e0c060',
	green  = '#b0c090',
	cyan   = '#80c0b0',
	blue   = '#80a0c0',
	purple = '#d0a0b0',
	brown  = '#a07050',
}

local U = {
	bg        = '#2f2f2f',
	bg2       = '#3a3a3a',
	bg3       = '#4a4a4a',

	fg        = '#f2e6c9',
	fg_dim    = '#b8aa8a',

	sel       = '#5a4a2a',

	status_bg   = '#3a3a3a',
	status_bg_f = '#4a4a3a',

	error_bg  = '#804040',
	info_bg   = '#4a4a3a',
	warn_bg   = '#7a6a20',
}

local default = style(U.fg, U.bg)

apply(lexers, {
	STYLE_DEFAULT     = default,
	STYLE_NOTHING     = bg(U.bg),

	STYLE_CURSOR      = style(U.bg, S.yellow),
	STYLE_CURSOR_PRIMARY = style(U.bg, S.orange),

	STYLE_CURSOR_LINE = bg(U.bg2),
	STYLE_SELECTION   = style(U.bg, S.yellow),

	STYLE_LINENUMBER  = style(U.fg_dim, U.bg),

	-- syntax
	STYLE_COMMENT      = style(S.blue):italic(),

	STYLE_CONSTANT     = style(S.orange),
	STYLE_NUMBER       = style(S.orange),

	STYLE_IDENTIFIER   = style(S.green),
	STYLE_FUNCTION     = style(S.cyan),

	STYLE_STATEMENT    = style(S.yellow),
	STYLE_KEYWORD      = style(S.yellow),

	STYLE_PREPROCESSOR = style(S.red),
	STYLE_TYPE         = style(S.brown),

	STYLE_STRING       = style(S.orange),
	STYLE_OPERATOR     = style(U.fg_dim),

	STYLE_SPECIAL      = style(U.fg_dim),

	STYLE_STATUS         = style(U.fg, U.status_bg),
	STYLE_STATUS_FOCUSED = style(U.fg, U.status_bg_f),

	STYLE_INFO    = style(U.fg, U.info_bg),
	STYLE_WARNING = style(U.bg, S.yellow):bold(),
	STYLE_ERROR   = style(U.fg, U.error_bg):bold(),

	STYLE_COLOR_COLUMN = bg(U.bg2),
	STYLE_SEPARATOR    = style(U.fg_dim),
})

