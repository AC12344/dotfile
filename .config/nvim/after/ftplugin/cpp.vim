" C++ 
nnoremap <C-c> :wa <CR> :!clear && cmake . -B build &&  cmake --build build/ --target stationboxTester <CR>
"nnoremap <C-c> :vert ter ++shell ++close cmake . -B build &&  cmake --build build/  || read<CR>
"inoremap <C-c> <Esc> :wa <CR> :!clear && cmake . -B build &&  cmake --build build/ <CR>

" nnoremap <Leader>r :!clear && ./build/project<CR>
" Run compiled executable
nnoremap <Leader>r :!clear && ./build/$(cat CMakeLists.txt \| grep -i add_executable \| sed -E "s/.*\(\s*(\S+).*/\1/g")<CR>

"command Symlink execute "! ln -s build/compile_commands.json ."

command! Rovimode execute ":let g:ycm_clangd_binary_path='/home/lasg/sem/rovi/docker/Robotics_and_Vision_Virtual_machine/rovi-clangd' | :YcmRestartServer"

nnoremap <Leader>d :!docker exec -w $(pwd -P) --interactive $(cat /tmp/rovi/rovi_container_id) bash -c './build/$(cat CMakeLists.txt \| grep -i add_executable \| sed -E "s/.*\(\s*(\S+).*/\1/g")'<CR>
 
nnoremap <C-d> :wa <CR> :!docker exec -w $(pwd -P) --interactive $(cat /tmp/rovi/rovi_container_id) bash -c 'cmake . -Bbuild &&  cmake --build build/'<CR>
