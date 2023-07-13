# Neovim Configuration 
My neovim configuration.
***
# Keymap Reference 
## Mappings
- View History - `<leader>vh`
- Goto Implementation - `gI`
- Goto previous file - TODO: `<leader>bb`
- Type Definition - `<leader>D`
- Document symbols - `<leader>ds`
- Workspace symbols - `<leader>ws`
- Hover documentation - `K`
	- Also shows type for variables

## Commands
- `:LspInfo` - check which LSPs are attached

## Scrolling
- Down - `CTRL-e/d/f`
- Up - `CTRL-u/b`

## Jumping
- `Ctrl+o` navigate to the previous location in the jump list (think `o` as old)
- `Ctrl+i` navigate to the next location in the jump list (`i` and `o` are usually next to each other)
- `g;` go to the previous change location
- `g,` go to the newer change location
- `gi` place the cursor at the same position where it was left last time in the Insert mode

```
  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  -- nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gd', '<cmd>lua require"telescope.builtin".lsp_definitions({jump_type="tab"})<CR>', '[G]oto [D]efinition')
  nmap('gds', '<cmd>lua require"telescope.builtin".lsp_definitions({jump_type="vsplit"})<CR>', '[G]oto [D]efinition [S]plit')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

```

### Markers
- Create bookmark - m{bookmark-name}
- Jump to bookmark
	- \`{bookmark-name} - move to exact location of bookmark
	- '{bookmark-name} - move to start of bookmark line

## Macros
- Start recording macro - q{macro-name}
	- Then, stop recording macro - q
- Play macro - @{macro-name}
