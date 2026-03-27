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

---- colors ----

local S = { -- Syntax
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
    bg        = '#333333',
    bg2       = '#3f3f3f',
    bg3       = '#4a4a4a',
    fg        = '#f0e0c0',
    fg_dim    = '#c0b090',
    sel       = '#4a4a3a',
    status_bg = '#4a4a3a',
    status_bg_f = '#5a5a45',
    error_bg  = '#804040',
    info_bg   = '#5a5a3a',
    black     = '#000000',
    white     = '#ffffff',
    gray      = '#666666',
}

---- ugly settings ----

-- Base styles
lexers.STYLE_DEFAULT     = 'fore:' .. U.fg .. ',back:' .. U.bg
lexers.STYLE_NOTHING     = 'back:' .. U.bg
lexers.STYLE_CURSOR      = 'fore:' .. U.black .. ',back:' .. U.fg
lexers.STYLE_CURSOR_LINE = 'back:' .. U.bg2
lexers.STYLE_SELECTION   = 'back:' .. U.sel
lexers.STYLE_LINENUMBER  = 'fore:' .. U.gray .. ',back:' .. U.bg

-- Syntax highlighting
lexers.STYLE_COMMENT      = 'fore:' .. S.blue
lexers.STYLE_CONSTANT     = 'fore:' .. S.red
lexers.STYLE_IDENTIFIER   = 'fore:' .. S.green
lexers.STYLE_STATEMENT    = 'fore:' .. S.yellow
lexers.STYLE_KEYWORD      = 'fore:' .. S.yellow
lexers.STYLE_PREPROCESSOR = 'fore:' .. S.red
lexers.STYLE_TYPE         = 'fore:' .. S.brown
lexers.STYLE_SPECIAL      = 'fore:' .. U.fg_dim
lexers.STYLE_STRING       = 'fore:' .. S.orange
lexers.STYLE_NUMBER       = 'fore:' .. S.red
lexers.STYLE_FUNCTION     = 'fore:' .. S.yellow
lexers.STYLE_OPERATOR     = 'fore:' .. U.fg

-- UI: status bar
lexers.STYLE_STATUS         = 'fore:' .. U.fg .. ',back:' .. U.status_bg
lexers.STYLE_STATUS_FOCUSED = 'fore:' .. U.fg .. ',back:' .. U.status_bg_f

-- Info, warnings, errors, ...
lexers.STYLE_INFO    = 'fore:' .. U.black .. ',back:' .. U.info_bg
lexers.STYLE_WARNING = 'fore:' .. S.yellow .. ',back:' .. U.bg3 .. ',bold'
lexers.STYLE_ERROR   = 'fore:' .. U.white .. ',back:' .. U.error_bg .. ',bold'

-- Misc UI
lexers.STYLE_COLOR_COLUMN = 'back:' .. U.bg2
lexers.STYLE_SEPARATOR    = 'fore:' .. U.fg_dim
