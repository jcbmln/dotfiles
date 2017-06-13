# Jacob Malone's Dotfiles

This is a collection of dotfiles and scripts I use.  

![Terminal.app](https://gitlab.com/jcbmln/dotfiles/raw/master/jacob-terminal.png)

The install script will check for existing dotfiles with the same name is the dotfiles in this repository and back them up to `~/dotfiles.old/`.

The script will also attempt to set up an Ubuntu-based development environment with `zsh` as my shell of choice. It will check to see if `zsh` is installed and install it if not. If `zsh` is installed and not already the default shell, the script will set it as the default, which will take effect on the next login or when a new instance of `zsh` is launched.

I mainly work in Windows 10 using [WSL](https://msdn.microsoft.com/commandline/wsl/about) as my development environment. I use [Visual Studio Code](https://code.visualstudio.com/) as my editor and [Cmder](http://cmder.net/) mini as my console emulator.

## Installation

You can install my dotfiles using curl:

```sh
sh -c "`curl -fsSL https://gitlab.com/jcbmln/dotfiles/raw/master/install.sh`"
```

or, using wget:

```sh
sh -c "`wget -O - --no-check-certificate https://gitlab.com/jcbmln/dotfiles/raw/master/install.sh`"
```

## Local Settings

The dotfiles can be easily extended to suit additional local
requirements by using the following files:

### `~/.zsh.local`

If the `~/.zsh.local` file exists, it will be automatically sourced
after all the other [shell related files](shell), thus, allowing its
content to add to or overwrite the existing aliases, settings, PATH,
etc.

### `~/.gitconfig.local`

If the `~/.gitconfig.local` file exists, it will be automatically
included after the configurations from [`~/.gitconfig`](git/gitconfig), thus, allowing
its content to overwrite or add to the existing `git` configurations.

**Note:** Use `~/.gitconfig.local` to store sensitive information such
as the `git` user credentials, e.g.:

```sh
[user]
  name = Jacob Malone
  email = jacob@example.com
```

## Resources

I used this page for help getting started with my dotfiles:

- [GitHub ❤ ~/](http://dotfiles.github.com/)

## License

The code is available under the [MIT license](LICENSE).