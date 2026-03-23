require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "LSP References (Telescope)" })
map("n", "<leader>fw", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", { desc = "Live Grep with Args" })
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "LSP Document Symbols" })
map("n", "<leader>fd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Telescope Go to Definition" })
map("n", "<leader>fv", "<cmd>vsplit | Telescope find_files<CR>", { desc = "Find file in vsplit" })
map("n", "<leader><tab>", "<C-^>", { desc = "toggle alternate buffer" })

-- real tabpages (not tabufline buffers)
map("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "tabpage new" })
map("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "tabpage close" })
map("n", "<leader>to", "<cmd>tabonly<CR>", { desc = "tabpage close others" })
map("n", "<leader>t]", "<cmd>tabnext<CR>", { desc = "tabpage next" })
map("n", "<leader>t[", "<cmd>tabprevious<CR>", { desc = "tabpage previous" })

-- splits/windows
map("n", "<leader>ws", "<cmd>split<CR>", { desc = "window split horizontal" })
map("n", "<leader>wv", "<cmd>vsplit<CR>", { desc = "window split vertical" })

-- move current window between split positions
map("n", "<leader>wmh", "<cmd>wincmd H<CR>", { desc = "window move far left" })
map("n", "<leader>wmj", "<cmd>wincmd J<CR>", { desc = "window move bottom" })
map("n", "<leader>wmk", "<cmd>wincmd K<CR>", { desc = "window move top" })
map("n", "<leader>wml", "<cmd>wincmd L<CR>", { desc = "window move far right" })

-- pop current split out into its own tabpage
map("n", "<leader>wt", "<cmd>wincmd T<CR>", { desc = "window move to new tabpage" })

-- quick terminal exits (no mouse/click needed)
map("t", "<C-\\>", "<C-\\><C-n>", { desc = "exit terminal mode" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
