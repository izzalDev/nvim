return {
  "nvim-lualine/lualine.nvim",
  config = function()
  require('lualine').setup {
    options = {
      component_separators = '',
      section_separators = { left = '', right = '' },
      globalstatus = true,
    },
    sections = {
      lualine_a = { { 'mode', separator = { left = ' ' }, right_padding = 2 } },
      lualine_b = { 'filename', 'branch' },
      lualine_c = {
        '%=', --[[ add your center components here in place of this comment ]]
      },
      lualine_x = {},
      lualine_y = { 'lsp_status', 'filetype', 'progress' },
      lualine_z = {
        { 'location', separator = { right = ' ' }, left_padding = 2 },
      },
    },
    inactive_sections = {
      lualine_a = { 'filename' },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'location' },
    },
    tabline = {},
    extensions = {},
  }
  end
}
