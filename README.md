# dotfiles

Terminal config shared between my Mac and Windows/WSL (Ubuntu).

## Setup on a new machine

```sh
# WSL/Ubuntu prerequisites
sudo apt update && sudo apt install -y zsh git curl

git clone https://github.com/lassenordahl/dotfiles ~/dotfiles
~/dotfiles/install.sh
chsh -s "$(which zsh)"   # if zsh isn't already your shell
```

## Font

Terminal font is Berkeley Mono, kept in a separate **private** repo (licensed):

```sh
gh auth login   # needed to clone the private repo
git clone https://github.com/lassenordahl/fonts ~/fonts && ~/fonts/install.sh
```

On WSL this also installs it on Windows and sets Windows Terminal to use it.

## hope

`hope <image>...` adds images to the public [hope](https://github.com/lassenordahl/hope) repo and rebuilds its README (images only, in order).

## Keeping in sync

Files in `~` are symlinks into this repo, so editing `~/.zshrc` edits the repo.

- Push changes: `cd ~/dotfiles && git commit -am "..." && git push`
- Pull changes: `dotsync`

## Machine-specific config

Not tracked, so put per-machine stuff here:

- `~/.zshrc.local`: extra PATHs, machine-only aliases
- `~/.gitconfig.local`: credential helpers etc.

## remote (desktop PC)

`remote` SSHes into the desktop PC (`Host desktop` in `~/.ssh/config`, over Tailscale) and runs
`claude-remote` there, which opens Claude in the Derailed checkout and resumes the latest session.
The PC is Windows (Derailed lives at `D:\dev`), so its `claude-remote` is `windows/claude-remote.cmd`, copied into `%USERPROFILE%\.local\bin`; it runs in `D:\dev` unless `CLAUDE_REMOTE_DIR` is set.
`ssh/authorized_keys` holds the public keys allowed in (public keys only, never private ones).
