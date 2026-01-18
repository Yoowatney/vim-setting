-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.opt.swapfile = false
-- vim.opt.paste = true

-- Bracketed paste mode (tmux auto-indent 방지)
-- local function set_paste()
--   vim.opt.paste = true
-- end
-- local function unset_paste()
--   vim.opt.paste = false
-- end

-- vim.api.nvim_create_autocmd("TermResponse", {
--   pattern = "*",
--   callback = function(args)
--     local resp = args.data or ""
--     if resp:find("\027%[200~") then
--       set_paste()
--     elseif resp:find("\027%[201~") then
--       vim.defer_fn(unset_paste, 10)
--     end
--   end,
-- })

-- 수동 토글 (F2로 paste 모드 on/off)
-- vim.keymap.set("n", "<F2>", ":set paste!<CR>", { desc = "Toggle paste mode" })
-- vim.keymap.set("i", "<F2>", "<C-o>:set paste!<CR>", { desc = "Toggle paste mode" })
