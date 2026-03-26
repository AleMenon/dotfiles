require("full-border"):setup()
local tokyo_night_theme = require("yatline-tokyo-night"):setup("storm") -- or moon/storm/day
require("yatline"):setup({
    theme = tokyo_night_theme,
    section_separator = { open = "", close = "" },
    part_separator = { open = "", close = "" },
    inverse_separator = { open = "", close = "" },
    header_line = {
        left = {
            section_a = {
                {type = "string", custom = false, name = "filter_query"},
                {type = "string", custom = false, name = "search_query"},
                {type = "string", custom = false, name = "finder_query"},
                {type = "line", custom = false, name = "tabs", params = {"left"}},
            }
        },
        right = {
            section_a = {
                {type = "coloreds", custom = true, name = {{" 󰇥 ", "#3c3836"}}},
            },
            section_c = {
                {type = "coloreds", custom = false, name = "count"},
                {type = "coloreds", custom = false, name = "task_states", params = {false}},
            }
        }
    },
    status_line = {
        left = {
            section_a = {
                {type = "string", custom = false, name = "tab_mode"},
            },
            section_b = {
                {type = "string", custom = false, name = "hovered_size"},
            },
            section_c = {
                {type = "string", custom = false, name = "hovered_path"},
            }
        },
        right = {
            section_a = {
                {type = "string", custom = false, name = "cursor_position"},
            },
            section_b = {
                {type = "string", custom = false, name = "cursor_percentage"},
            },
            section_c = {
                {type = "string", custom = false, name = "hovered_file_extension", params = { true }},
                {type = "coloreds", custom = false, name = "permissions"},
            }
        }
    },
})
