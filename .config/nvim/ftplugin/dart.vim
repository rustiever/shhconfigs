"Coc-flutter
nnoremap <F5> :CocCommand flutter.run<CR>
nnoremap <F17> :CocCommand flutter.dev.quit<CR>
nnoremap <F6> :CocCommand flutter.pub.get<CR>


autocmd BufWritePre *.dart :call CocAction('runCommand', 'editor.action.organizeImport')

