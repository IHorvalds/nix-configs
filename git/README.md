# Git global configurations

## .globalgitignore

This is hidden by default, but it doesn't have to start with a dot.
It's loaded by common.git.conf.

## common.git.conf

Include this file by doing the following in the global git config

```$HOME/.gitconfig
[user]
  ...

[include]
  path = ~/common.git.conf

```
