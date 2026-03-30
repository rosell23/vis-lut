--[[
--
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
	return setmetatable({
		fg = fg,
		bg = bg,
	}, {
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

local function bg(color)
	return style(nil, color)
end

local function apply(lx, styles)
	for k, v in pairs(styles) do
		lx[k] = tostring(v)
	end
end

local S = { -- syntax
	red    = '#ff8080',
	orange = '#ffa860',
	yellow = '#e0c060',
	green  = '#b0c090',
	cyan   = '#80c0b0',
	blue   = '#80a0c0',
	purple = '#d0a0b0',
	brown  = '#a07050',
	fg     = '#f0e0c0',
}

local U = { -- UI
	bg          = '#333333',
	bg2         = '#3f3f3f',
	bg3         = '#4a4a4a',
	fg          = '#f0e0c0',
	fg_dim      = '#c0b090',
	sel         = '#4a4a3a',
	status_bg   = '#4a4a3a',
	status_bg_f = '#5a5a45',
	error_bg    = '#804040',
	info_bg     = '#5a5a3a',
	black       = '#000000',
	white       = '#ffffff',
	gray        = '#666666',
}

-- ---------- styles ----------

local default = style(U.fg, U.bg)

apply(lexers, {

	-- Base
	STYLE_DEFAULT     = default,
	STYLE_NOTHING     = bg(U.bg),
	STYLE_CURSOR      = style(U.black, U.fg),
	STYLE_CURSOR_LINE = bg(U.bg2),
	STYLE_SELECTION   = bg(U.sel),
	STYLE_LINENUMBER  = style(U.gray, U.bg),

	-- Syntax
	STYLE_COMMENT      = style(S.blue):italic(),
	STYLE_CONSTANT     = style(S.red),
	STYLE_IDENTIFIER   = style(S.green),
	STYLE_STATEMENT    = style(S.yellow),
	STYLE_KEYWORD      = style(S.yellow),
	STYLE_PREPROCESSOR = style(S.red),
	STYLE_TYPE         = style(S.brown),
	STYLE_SPECIAL      = style(U.fg_dim),
	STYLE_STRING       = style(S.orange),
	STYLE_NUMBER       = style(S.red),
	STYLE_FUNCTION     = style(S.yellow),
	STYLE_OPERATOR     = style(U.fg),

	-- Status bar
	STYLE_STATUS         = style(U.fg, U.status_bg),
	STYLE_STATUS_FOCUSED = style(U.fg, U.status_bg_f),

	STYLE_INFO    = style(U.black, U.info_bg)
	STYLE_WARNING = style(U.black, S.yellow):bold()
	STYLE_ERROR   = style(U.white, U.error_bg):bold()

	-- Misc UI
	STYLE_COLOR_COLUMN = bg(U.bg2),
	STYLE_SEPARATOR    = style(U.fg_dim),
})

