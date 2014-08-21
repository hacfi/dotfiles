# OS X Setup


### 1. Run Software Update

### 2. Install Growl & iPhoto via App Store

### 3. Open Terminal and run

```
xcode-select --install
```

Select Install

### 4. Get this repo by running

```
git clone git@github.com:hacfi/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

### 5. Run OS X setup file

```
~/.dotfiles/osx/setup.sh
```

### 6. Install homebrew

```
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```

### 7. Install brew packages

```
~/.dotfiles/osx/brew_default.sh
```

### 8. Install brew cask

```
~/.dotfiles/osx/brew_cask.sh
```

### 9. Install brew cask packages

```
~/.dotfiles/osx/brew_cask_default.sh
```

### 10. Install oh-my-zsh

```
curl -L http://install.ohmyz.sh | sh
```

### 11. Install hacfi zsh package

```
~/.dotfiles/zsh/install.sh
```


### 12. Link git files

```
~/.dotfiles/git/link.sh
```