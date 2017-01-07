# Installation instructions

## zsh

Create a new folder for completions:

```sh
mkdir -p ~/.zsh/completions
```

Copy the file `/etc/sdk.zsh_completion` from the location where `sdk` is installed to the folder `~/.zsh/completions/` and rename it to `_sdk`:

```sh
cp /path/to/etc/sdk.zsh_completion ~/.zsh/completions/ \
    mv ~/.zsh/completions/sdk.zsh_completion ~/.zsh/completions/_sdk
```

Then add the following lines to your `.zshrc` file:

```sh
fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit
```
