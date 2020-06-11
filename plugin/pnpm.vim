" vim-pnpm - pnpm command bindings for vim/NeoVim
" Maintainer: Rajasegar Chandran <rajasegar.c@gmail.com>
" Version: 0.0.3


if exists('g:vim_pnpm')
  finish
endif
let vim_pnpm=1

autocmd BufRead,BufNewFile pnpm-lock.yaml,package.json,*.js compiler pnpm
autocmd BufRead,BufNewFile pnpm-lock.yaml,package.json,*.js setlocal makeprg=pnpm

if !exists('g:pnpm_command')
  let g:pnpm_command = "pnpm {cmd}"
endif

com! -nargs=* PnpmAdd call pnpm#run('add ' . <q-args>)
com! -nargs=* PnpmInstall call pnpm#run('install ' . <q-args>)
com! -nargs=* PnpmUpdate call pnpm#run('update ' . <q-args>)
com! -nargs=* PnpmRemove call pnpm#run('remove ' . <q-args>)
com! -nargs=* PnpmLink call pnpm#run('link ' . <q-args>)
com! -nargs=* PnpmUnlink call pnpm#run('unlink ' . <q-args>)
com! -nargs=* PnpmTest call pnpm#run('test ' . <q-args>)
com! -nargs=* PnpmRun call pnpm#run('run ' . <q-args>)

func! pnpm#run(cmd)
  let s:pnpm_command = substitute(g:pnpm_command, "{cmd}", a:cmd, 'g')
  exec '!'.s:pnpm_command
endf

" Mappings
nnoremap <leader>Pa :call PnpmAdd <Space>
nnoremap <leader>Pt :call PnpmTest() <CR>
nnoremap <leader>Pi :call PnpmInstall() <CR>
nnoremap <leader>Pr :call PnpmRun <Space>
