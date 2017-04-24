# Completions plugin for zsh

## Install

Create a new folder for completions:

```sh
mkdir -p ~/.zsh/completions
```

Copy the file `/sdk/_sdk` from the location where `sdk` is installed to the folder `~/.zsh/completions/`:

```sh
cp /path/to/zsh/_sdk ~/.zsh/completions/
```

Then add the following lines to your `.zshrc` file:

```sh
fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit
```

### Install using antigen

```sh
antigen bundle sdkman/sdkman-cli zsh
```
