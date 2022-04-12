# dotfiles

The conky script is a modified "now-clocking" script found here:
https://www.omgubuntu.co.uk/2021/07/spotify-now-playing-conky-linux-widget

The neofetch thing with the icons is an idea of xfcisco, not mine. See here for the original file:
https://github.com/xfcisco/BarricadesRice/blob/main/neofetch-config/config.conf

It support spotify and firefox (youtube), when nothing is playing it display basic system info (CPU,RAM...)

you can type
```
$ chmod +x setup.sh
$ ./setup.sh --all
```
that should install all the config file at the right place without deleting anything

You can also choose to install each part as you want:
```
$ ./setup zsh vim tmux
```

see `./setup --help` for more info

*it should work (not sure)*

With popOS it give something that look like this:

![screenshot](screenshot.png)
```
OS : Pop! OS
DE : Gnome 40
Icons pack : BeautyLine (with candy-icons terminix svg for kitty)
Theme : Nordic-v40
Cursor : Nordzy-cursors
Spotify : spicetify plugin with dribbblish theme and nord-dark color scheme
```
