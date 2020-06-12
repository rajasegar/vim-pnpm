" vim-pnpm - pnpm command bindings for vim/NeoVim
" Maintainer: Rajasegar Chandran <rajasegar.c@gmail.com>
" Version: 0.1.0


if exists('g:vim_pnpm')
  finish
endif
let vim_pnpm=1

if !exists('g:pnpm_command')
  let g:pnpm_command = "pnpm {cmd}"
endif

" Manage dependencies
com! -nargs=* PnpmAdd call pnpm#run('add ' . <q-args>)
com! -nargs=* PnpmAddDev call pnpm#run('add -D ' . <q-args>)
com! -nargs=* PnpmAddOptional call pnpm#run('add -O ' . <q-args>)
com! -nargs=* PnpmInstall call pnpm#run('install ' . <q-args>)
com! -nargs=* PnpmUpdate call pnpm#run('update ' . <q-args>)
com! -nargs=* PnpmRemove call pnpm#run('remove ' . <q-args>)
com! -nargs=* PnpmLink call pnpm#run('link ' . <q-args>)
com! -nargs=* PnpmUnlink call pnpm#run('unlink ' . <q-args>)
com! -nargs=* PnpmImport call pnpm#run('import ' . <q-args>)
com! -nargs=* PnpmRebuild call pnpm#run('rebuild ' . <q-args>)
com! -nargs=* PnpmPrune call pnpm#run('prune ' . <q-args>)
com! -nargs=* PnpmInstallTest call pnpm#run('install-test ' . <q-args>)

" Review dependencies
com! -nargs=* PnpmAudit call pnpm#run('audit ' . <q-args>)
com! -nargs=* PnpmList call pnpm#run('list ' . <q-args>)
com! -nargs=* PnpmOutdated call pnpm#run('outdated ' . <q-args>)
com! -nargs=* PnpmWhy call pnpm#run('why ' . <q-args>)

" Run scripts
com! -nargs=* PnpmTest call pnpm#run('test ' . <q-args>)
com! -nargs=* PnpmRun call pnpm#run('run ' . <q-args>)
com! -nargs=* PnpmStart call pnpm#run('start ' . <q-args>)
com! -nargs=* PnpmStop call pnpm#run('stop ' . <q-args>)

" Misc
com! -nargs=* PnpmPublish call pnpm#run('publish ' . <q-args>)
com! -nargs=* PnpmRecursive call pnpm#run('recursive ' . <q-args>)
com! -nargs=* PnpmServer call pnpm#run('server ' . <q-args>)
com! -nargs=* PnpmStore call pnpm#run('store ' . <q-args>)

func! pnpm#run(cmd)
  let s:pnpm_command = substitute(g:pnpm_command, "{cmd}", a:cmd, 'g')
  exec '!'.s:pnpm_command
endf

" Mappings
nnoremap <leader>Pa :call pnpm#run('add ') <Space>
nnoremap <leader>Pt :call pnpm#run('test') <CR>
nnoremap <leader>Pi :call pnpm#run('install') <CR>
nnoremap <leader>Pr :call pnpm#run(' ') <Space>
