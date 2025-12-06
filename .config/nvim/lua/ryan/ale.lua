vim.g.ale_set_highlights = 1

vim.g.ale_completion_enabled = 1
-- let g:ale_python_flake8_config_file = '~/.config/flake8'
--- This is working "
-- Rest of pycodestyle config seems to work in ~/.config/pycodestyle
-- --- Don't think this is doing shit
vim.g.ale_python_flake8_options = '--max-line-length=160 --ignore=E501,E266,W503 --extend-ignore=W503'
vim.g.ale_python_pyright_options = '--max-line-length=160 --ignore=E501,E266,W503 --extend-ignore=W503'
vim.g.ale_python_basedpyright_options = '--max-line-length=160 --ignore=E501,E266,W503 --extend-ignore=W503'
--vim.g.ale_python_pylsp_options = '--max-line-length=140 --ignore=E501,E266,W503 --extend-ignore=W503'
vim.g.ale_python_ruff_options = '--max-line-length=140 --ignore=E501,E266,W503 --extend-ignore=W503'
vim.g.ale_python_flake8_options = '--max-line-length=160 --ignore=E501,E266,W503 --extend-ignore=W503'

vim.g.ale_python_black_options = '--max-line-length=160 --ignore=E501,E266,W503 --extend-ignore=W503'
vim.g.ale_python_isort_options = '--max-line-length=160 --ignore=E501,E266,W503 --extend-ignore=W503'

vim.g.ale_python_auto_uv = true
vim.g.ale_python_auto_virtualenv = true
vim.g.ale_set_quickfix = true
---
vim.g.ale_linters = {
   python = {'ruff', 'flake8','basedpyright', 'pyright'},-- pylsp
   -- python = {"basedpyright"},
   -- TODO: Fix this shit, pick one or two, more is not merrier
   rust = {'analyzer', 'cargo', 'rls', 'rustc'},
   ruby = {'rubocop'},
   lua = {'luacheck'},
   nix = {'nixd'},
}


-- " 'pylint'
vim.g.ale_rust_rls_toolchain = 'stable'

vim.g.ale_fixers = {
   python = {'ruff', 'black','isort'},
   ruby = {'rubocop'},
   lua = {'luafmt', 'stylua'},
   --nix = {'luafmt', 'stylua'},
}

-- call ale#Set('python_flake8_options', '--config=$HOME/.config/flake8')
----- IMPORTANT -----
-- Storing buffer b:ale_fixer in /home/ryan/.vim/ftplugin/python.vim 
-- Not true anymore, but still good to know if having plugin 'interference'
vim.g.ale_fix_on_save = 1

