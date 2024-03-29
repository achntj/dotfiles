![setup screenshot](/assets/setup.png)

# Installation

- Install brew
- (On Existing devices only) Update brew and upgrade neovim
- Clone this Directory (rename to .config AFTER cloning)
- Run (https://gist.github.com/ChristopherA/a579274536aab36ea9966f301ff14f3f)

```
brew bundle --file=~/.config/Brewfile
```

- import itermPreferences in iterm2

- Run

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

- Open packer.lua, run :so command. Then Run PackerInstall / PackerSync

- Add Fira Code Nerd Font

```
brew tap homebrew/cask-fonts &&
brew install --cask font-fira-code-nerd-font
```

- Change font in iterm, once installed.

- Setup clangd globally by adding this to ~/.clangd

```
CompileFlags:
    Add: [-std=c++17]
```
