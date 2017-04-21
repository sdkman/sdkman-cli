# Installation instructions

## zsh

Create a new folder for completions:

```sh
mkdir -p ~/.zsh/completions
```

Copy the file `/etc/_sdk` from the location where `sdk` is installed to the folder `~/.zsh/completions/`:

```sh
cp /path/to/etc/sdk.zsh_completion ~/.zsh/completions/
```

Then add the following lines to your `.zshrc` file:

```sh
fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit
```

### Using antigen

```sh
antigen bundle sdkman/sdkman-cli zsh
```
