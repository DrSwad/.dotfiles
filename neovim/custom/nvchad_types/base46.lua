---@meta

--- List of options for `vim.api.nvim_set_hl`
---@class APISetHighlightOpts
---@field fg string Color of foreground
---@field bg string color of background
---@field sp string
---@field blend number integer between 0 and 100, level of opacity
---@field bold boolean bolded text or not
---@field standout boolean
---@field underline boolean
---@field undercurl boolean
---@field underdouble boolean
---@field underdotted boolean
---@field underdashed boolean
---@field strikethrough boolean
---@field italic boolean
---@field reverse boolean
---@field nocombine boolean
---@field link string name of another highlight group to link to, see |hi-link|
---@field default boolean Don't override existing definition
---@field ctermfg number Sets foreground of cterm color
---@field ctermbg number Sets background of cterm color
---@field cterm string comma-separated list of cterm opts. For more information, check `:h highlight-args`

---@class Base46HLGroups : APISetHighlightOpts
---@field fg string|Base46Colors
---@field bg string|Base46Colors color of background
---@field sp string|Base46Colors

---@alias Base30Colors
---| '"white"'
---| '"darker_black"'
---| '"black"'
---| '"black2"'
---| '"one_bg"'
---| '"one_bg2"'
---| '"one_bg3"'
---| '"grey"'
---| '"grey_fg"'
---| '"grey_fg2"'
---| '"light_grey"'
---| '"red"'
---| '"baby_pink"'
---| '"pink"'
---| '"line"'
---| '"green"'
---| '"vibrant_green"'
---| '"blue"'
---| '"nord_blue"'
---| '"yellow"'
---| '"sun"'
---| '"purple"'
---| '"dark_purple"'
---| '"teal"'
---| '"orange"'
---| '"cyan"'
---| '"statusline_bg"'
---| '"lightbg"'
---| '"pmenu_bg"'
---| '"folder_bg"'

---@alias Base46Colors
---| Base30Colors
---| '"base00"'
---| '"base01"'
---| '"base02"'
---| '"base03"'
---| '"base04"'
---| '"base05"'
---| '"base06"'
---| '"base07"'
---| '"base08"'
---| '"base09"'
---| '"base0A"'
---| '"base0B"'
---| '"base0C"'
---| '"base0D"'
---| '"base0E"'
---| '"base0F"'
