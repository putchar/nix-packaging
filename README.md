# nix-packaging

This repo is used to test new package prior to open a pull request in nixpkgs main repo.

# how to test a package
Make a branch inside your fork of nixpkgs repo
hack your file
at the root of nixpkgs repo, just use a command like :
```
nix-build -A python3Packages.subprocess-tee
```

## python
the command usually used for now are
```
nix-build default.nix
nix-shell shell.nix
```
