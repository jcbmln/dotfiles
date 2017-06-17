# Jacob Malone's Dotfiles

This is a collection of dotfiles and scripts I use.  

![Terminal.app](https://gitlab.com/jcbmln/dotfiles/raw/master/jacob-terminal.png)

The install script will overwrite any files and folders with the same name.

The script will also attempt to set up an Ubuntu-based development environment with `zsh` as my shell of choice. It will check to see if `zsh` is installed and install it if not. If `zsh` is installed and not already the default shell, the script will set it as the default, which will take effect on the next login or when a new instance of `zsh` is launched.

## Installation

You can install my dotfiles using curl:

```sh
sh -c "`curl -fsSL https://gitlab.com/jcbmln/dotfiles/raw/master/install.sh`"
```

or, using wget:

```sh
sh -c "`wget -O - --no-check-certificate https://gitlab.com/jcbmln/dotfiles/raw/master/install.sh`"
```

## Resources

I used this page for help getting started with my dotfiles:

- [GitHub ❤ ~/](http://dotfiles.github.com/)

## License

The code is available under the [MIT license](LICENSE).