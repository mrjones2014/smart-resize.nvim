if vim.api.nvim_add_user_command == nil then
  vim.cmd([[
    " resizing
    command! -nargs=* SmartResizeLeft :lua require('smart-splits').resize_left(<args>)<CR>
    command! -nargs=* SmartResizeRight :lua require('smart-splits').resize_right(<args>)<CR>
    command! -nargs=* SmartResizeUp :lua require('smart-splits').resize_up(<args>)<CR>
    command! -nargs=* SmartResizeDown :lua require('smart-splits').resize_down(<args>)<CR>
    " movements
    command! SmartCursorMoveLeft :lua require('smart-splits').move_cursor_left()<CR>
    command! SmartCursorMoveRight :lua require('smart-splits').move_cursor_right()<CR>
    command! SmartCursorMoveUp :lua require('smart-splits').move_cursor_up()<CR>
    command! SmartCursorMoveDown :lua require('smart-splits').move_cursor_down()<CR>
  ]])
  return
end

local function resize_handler(direction)
  return function(args)
    local amount
    if args and args.args and #args.args > 0 then
      amount = args.args
    end

    require('smart-splits')['resize_' .. direction](amount)
  end
end

-- resizing
vim.api.nvim_add_user_command('SmartResizeLeft', resize_handler('left'), { desc = '"Smart" resize left', nargs = '*' })
vim.api.nvim_add_user_command(
  'SmartResizeRight',
  resize_handler('right'),
  { desc = '"Smart" resize right', nargs = '*' }
)
vim.api.nvim_add_user_command('SmartResizeUp', resize_handler('up'), { desc = '"Smart" resize up', nargs = '*' })
vim.api.nvim_add_user_command('SmartResizeDown', resize_handler('down'), { desc = '"Smart" resize down', nargs = '*' })

-- movements
vim.api.nvim_add_user_command(
  'SmartCursorMoveLeft',
  require('smart-splits').move_cursor_left,
  { desc = '"Smart" resize left' }
)
vim.api.nvim_add_user_command(
  'SmartCursorMoveRight',
  require('smart-splits').move_cursor_right,
  { desc = '"Smart" resize right' }
)
vim.api.nvim_add_user_command(
  'SmartCursorMoveUp',
  require('smart-splits').move_cursor_up,
  { desc = '"Smart" resize up' }
)
vim.api.nvim_add_user_command(
  'SmartCursorMoveDown',
  require('smart-splits').move_cursor_down,
  { desc = '"Smart" resize down' }
)
