# My dotfiles

This repository contains all my configuration files for Linux, Windows and Mac OS X.

## Configurations

```sh
$ git clone https://github.com/ilyachur/dotfiles.git
$ cd dotfiles
$ git submodule update --init --recursive
$ ./install.sh
```

### Zsh

Mac OS X Installation:
```sh
$ brew install zsh
```

Ubuntu Installation:
```sh
$ sudo apt-get install zsh
```

### Ripgrep

I use riprep for search, it is really nice! For more information see [here](https://github.com/BurntSushi/ripgrep).

### FZF

The next nice tool that I use is [FZF](https://github.com/junegunn/fzf). It helped me to use fuzzy finder in the terminal.

### Install cmake-language-server

For cmake lsp I use [cmake-language-server](https://github.com/regen100/cmake-language-server).


## Mac Installation

 1. Install brew
 ```sh
 $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

 ```
 2. Show hidden files:
 ```sh
 $ defaults write com.apple.Finder AppleShowAllFiles true
 $ killall Finder
 ```

 3. Install tools:
 ```sh
 brew install wget zsh tmux llvm gawk cmake ctags python3
 ```

 4. Add clangd to path:
 ```sh
 $ ln -s /usr/local/Cellar/llvm/<llvm_version>/bin/clangd /usr/local/bin
 ```

 5. Install [MacVim](https://macvim-dev.github.io/macvim/)

 6. Add MacVim to path
 ```sh
 $ ln -s /Applications/MacVim.app/Contents/bin/vim /usr/local/bin/
 ```

 7. Install [iTerm2](https://www.iterm2.com/)

 8. Install [Nerd front](https://github.com/ryanoasis/nerd-fonts) to iTerm2 for example [Roboto](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/RobotoMono)

 9. Go to iTerm Preferences → Profiles, select your profile, then the Keys tab. Click Load Preset... and choose Natural Text Editing.

 10. Clone this repository and install config files

 11. Change Key Repeat and Delay Until Repeat settings

