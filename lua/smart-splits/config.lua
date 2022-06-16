local M = {
  ignored_buftypes = {
    'nofile',
    'quickfix',
    'prompt',
  },
  ignored_filetypes = {
    'NvimTree',
  },
  move_cursor_same_row = false,
  resize_mode = {
    quit_key = '<ESC>',
    silent = false,
    hooks = {
      on_enter = nil,
      on_leave = nil,
    },
  },
}

local function default_bool(value, default)
  if value == nil then
    return default
  end
  return value
end

function M.setup(config)
  M.ignored_buftypes = config.ignored_buftypes or M.ignored_buftypes
  M.ignored_filetypes = config.ignored_filetypes or M.ignored_filetypes
  M.move_cursor_same_row = default_bool(config.move_cursor_same_row, M.move_cursor_same_row)
  M.resize_mode.quit_key = config.resize_mode.quit_key or M.resize_mode.quit_key
  M.resize_mode.silent = default_bool(config.resize_mode.silent, M.resize_mode.silent)
  M.resize_mode.hooks.on_enter = config.resize_mode.hooks.on_enter or nil
  M.resize_mode.hooks.on_leave = config.resize_mode.hooks.on_leave or nil

  -- TODO: Remove this code block in the next commits
  if config.resize_mode_quit_key then
    M.resize_mode.quit_key = config.resize_mode_quit_key
    vim.notify('smart-splits: resize_mode_quit_key has been changed to resize_mode.quit_key', vim.log.levels.WARN)
  end
  if config.resize_mode_silent then
    M.resize_mode.silent = config.resize_mode_silent
    vim.notify('smart-splits: resize_mode_silent has been changed to resize_mode.silent', vim.log.levels.WARN)
  end
end

return M
