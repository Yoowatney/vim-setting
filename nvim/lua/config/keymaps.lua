-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Normal 모드: Alt+k로 위로 이동, Alt+j로 아래로 이동
map("n", "˚", ":m .-2<CR>==", { noremap = true, silent = true, desc = "Move line up" })
map("n", "∆", ":m .+1<CR>==", { noremap = true, silent = true, desc = "Move line down" })

-- Insert 모드: Alt+k와 Alt+j로 라인 이동 후 Insert 모드로 복귀
map("i", "˚", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true, desc = "Move line up" })
map("i", "∆", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true, desc = "Move line down" })

-- Visual 모드: Alt+k와 Alt+j로 선택된 라인 이동
map("v", "˚", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection up" })
map("v", "∆", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection down" })

-- Q 비활성화
map("", "Q", "<Nop>", { noremap = true, silent = true, desc = "Disable Q" })

-- QQ 강제 종료
map("", "QQ", ":q!<CR>", { noremap = true, silent = true, desc = "Force quit" })

-- ㅃㅃ 강제 종료
map("", "ㅃㅃ", ":q!<CR>", { noremap = true, silent = true, desc = "Force quit (Korean)" })

-- W 강제 저장
map("", "W", ":w!<CR>", { noremap = true, silent = true, desc = "Force save" })
