![setup screenshot](/assets/setup.png)

# Installation

- Install brew
- (On Existing devices only) Update brew
- Clone this Directory (rename to .config AFTER cloning)
- Add this to ~/.zprofile
```
export ZDOTDIR="$HOME/.config/zsh"
```

- setup git config username and email

- Run (https://gist.github.com/ChristopherA/a579274536aab36ea9966f301ff14f3f)

```
brew bundle --file=~/.config/Brewfile
```

- install nvim and nodejs

- import itermPreferences in iterm2
- import user profile

- Add Fira Code Nerd Font

```
brew install --cask font-fira-code-nerd-font
```

### Optionally do these

- Setup clangd globally by adding this to ~/.clangd

```
CompileFlags:
    Add: [-std=c++17]
`
