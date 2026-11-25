# SigmaOS dots

> Forked from SigmaOS/omadots (MIT). See `SIGMAOS_FORK.md`.

Shared user dotfiles and shell configs for SigmaOS: starship, tmux, git,
mise, shared bash/zsh shell config, fish config, zsh templates, and helper
scripts. This repository consolidates the former `SigmaOS-fish` and
`SigmaOS-zsh` split repos.

## Layout

- `config/` — copied to `~/.config/` by `install.sh`
  - `shell/` — shared bash/zsh aliases, functions, envs, init, zoptions, completions
  - `fish/` — fish `conf.d`, `functions`, `completions`, `templates`
  - `zsh/` — zsh templates
  - `starship.toml`, `tmux/`, `git/`, `mise/`, `btop/`, `nvim/`, `opencode/`
- `bin/` — helper scripts installed to `~/.local/bin/`

## Install

```bash
git clone https://github.com/AaryanSinghChauhan09/SigmaOS-dots.git
cd SigmaOS-dots
./install.sh
```

## Documentation

Wiki documentation is available in the SigmaOS Wiki Staging repository:

- [SigmaOS Wiki Staging](https://github.com/AaryanSinghChauhan09/sigmaos-wiki-staging#SigmaOS-dots) - Full Wiki documentation for all SigmaOS components
