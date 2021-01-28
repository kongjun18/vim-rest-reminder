" Remind vimmer to take a break
" Last Change: 2021-01-28
" Author: Kong Jun <kongjun18@outlook.com>
" Github: https://github.com/kongjun18
" License: GPL-v3

if exists('g:loaded_rest_reminder_vim') || &cp || !has('nvim') || !has('timers')
    finish
endif
let g:loaded_rest_reminder_vim = 1

let s:counter = 0
let s:win = -1
let s:buf = -1

function s:echo_rest_alert() abort
    let l:editor_width = &columns
    let l:editor_height = &lines
    let l:win_width = 84
    let l:win_height = 13

    let l:messages = [] 
    call add(l:messages, '+==================================================================================+')
    call add(l:messages, '|          _____ ____ ___  __        ___    ____  _   _ ___ _   _  ____            |')
    call add(l:messages, '|          |  ___| __ )_ _| \ \      / / \  |  _ \| \ | |_ _| \ | |/ ___|          |')
    call add(l:messages, '|          | |_  |  _ \| |   \ \ /\ / / _ \ | |_) |  \| || ||  \| | |  _           |')
    call add(l:messages, '|          |  _| | |_) | |    \ V  V / ___ \|  _ <| |\  || || |\  | |_| |          |')
    call add(l:messages, '|          |_|   |____/___|    \_/\_/_/   \_\_| \_\_| \_|___|_| \_|\____|          |')
    call add(l:messages, '+==================================================================================+')
    call add(l:messages, '|__   _____  _   _   _   _ _____ _____ ____    _____ ___    ____  _____ ____ _____ |')
    call add(l:messages, '|\ \ / / _ \| | | | | \ | | ____| ____|  _ \  |_   _/ _ \  |  _ \| ____/ ___|_   _||')
    call add(l:messages, '| \ V / | | | | | | |  \| |  _| |  _| | | | |   | || | | | | |_) |  _| \___ \ | |  |')
    call add(l:messages, '|  | || |_| | |_| | | |\  | |___| |___| |_| |   | || |_| | |  _ <| |___ ___) || |  |')
    call add(l:messages, '|  |_| \___/ \___/  |_| \_|_____|_____|____/    |_| \___/  |_| \_\_____|____/ |_|  |')
    call add(l:messages, '+==================================================================================+')

    let s:buf = nvim_create_buf(v:true, v:true)
    call nvim_buf_clear_namespace(s:buf, -1, 0, -1)             " clear highlight of popup window
    call nvim_buf_set_name(s:buf, 'rest_alert')
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, l:messages)
    call nvim_buf_set_option(s:buf, 'modifiable', v:false)
    let l:win_opt = #{relative: 'editor',
                    \ row: (l:editor_height - l:win_height)/2,
                    \ col: (l:editor_width - l:win_width)/2,
                    \ width: l:win_width,
                    \ height: l:win_height,
                    \ style: 'minimal',
                    \} 
    " TODO: Editor windows is too small
    let s:win = nvim_open_win(s:buf, v:true, l:win_opt)
    highlight def RestAlertColor term=bold ctermbg=Black ctermfg=Red gui=bold guibg=Black guifg=Red
    call nvim_win_set_option(s:win, 'winhl', 'Normal:RestAlertColor')
endfunction

function s:callback(timer)
    let s:counter += 1
    if s:counter == 45
        call s:echo_rest_alert()
    elseif s:counter == 55
        if nvim_win_is_valid(s:win)
            call nvim_win_close(s:win, v:true)
            let s:counter = 0
        else
            let s:counter = 10
        endif
        if bufexists(s:buf)
            call nvim_buf_delete(s:buf, {'force' : 1})
        endif
    endif
endfunction

let g:rest_reminder_on_startup = get(g:, 'rest_reminder_on_startup', v:true)
if g:rest_reminder_on_startup
    let g:rest_reminder_timer = timer_start(60000, funcref('<SID>callback'), {'repeat': -1})
endif
