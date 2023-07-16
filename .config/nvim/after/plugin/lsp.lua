local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'eslint',
})

lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»',
})

-- Remap for completion
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
})

--lsp.set_preferences({
  --sign_icons = { }
--})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gn", function () vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "gN", function () vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "gt", function () vim.lsp.buf.type_definition() end, opts)
  vim.keymap.set("n", "<leader>ca", function () vim.lsp.buf.code_action() end, opts)
  --vim.keymap.set("n", "K", function () vim.lsp.buf.hover() end, opts)
  --vim.keymap.set("n", "gd", function () vim.lsp.buf.definition() end, opts)
  --vim.keymap.set("n", "gD", function () vim.lsp.buf.declaration() end, opts)
  --vim.keymap.set("n", "gi", function () vim.lsp.buf.implementation() end, opts)
  --vim.keymap.set("n", "gr", function () vim.lsp.buf.references() end, opts)
  --vim.keymap.set("n", "<F2>", function () vim.lsp.buf.rename() end, opts)
  --vim.keymap.set("n", "<leader>vws", function () vim.lsp.buf.workspace_symbol() end, opts)
  --vim.keymap.set("n", "<leader>vd", function () vim.diagnostic.open_float() end, opts)
  --vim.keymap.set("i", "<C-h>", function () vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()
