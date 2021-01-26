A plugin that reminds user to take a break.

Once user focus on Vim more than 45 minutes, It will pop a window in the middle of screen:
```
+==================================================================================+
|          _____ ____ ___  __        ___    ____  _   _ ___ _   _  ____            |
|          |  ___| __ )_ _| \ \      / / \  |  _ \| \ | |_ _| \ | |/ ___|          |
|          | |_  |  _ \| |   \ \ /\ / / _ \ | |_) |  \| || ||  \| | |  _           |
|          |  _| | |_) | |    \ V  V / ___ \|  _ <| |\  || || |\  | |_| |          |
|          |_|   |____/___|    \_/\_/_/   \_\_| \_\_| \_|___|_| \_|\____|          |
+==================================================================================+
|__   _____  _   _   _   _ _____ _____ ____    _____ ___    ____  _____ ____ _____ |
|\ \ / / _ \| | | | | \ | | ____| ____|  _ \  |_   _/ _ \  |  _ \| ____/ ___|_   _||
| \ V / | | | | | | |  \| |  _| |  _| | | | |   | || | | | | |_) |  _| \___ \ | |  |
|  | || |_| | |_| | | |\  | |___| |___| |_| |   | || |_| | |  _ <| |___ ___) || |  |
|  |_| \___/ \___/  |_| \_|_____|_____|____/    |_| \___/  |_| \_\_____|____/ |_|  |
+==================================================================================+
```

# Requirements
- Neovim with *timer* support

# Installation
For [dein.vim](https://github.com/Shougo/dein.vim) users:
```
call dein#add('kongjun18/vim-rest-reminder', {
            \ 'lazy': 1,
            \ 'on_event': 'BufReadPost'
            \ })
```
If you don't want to enable it at startup time, please set `g:rest_reminder_on_startup` to zero.

# Acknowledgements

I am a newer to vimscript. This plugin was inspired by the post [neovim 悬浮窗口介绍](https://zhuanlan.zhihu.com/p/60907165) on [ZhiHu](https://www.zhihu.com).

