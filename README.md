# nix

Personal NixOS/nix-darwin configuration managing two machines with a shared module system.

## Machines

| Host      | Platform                    | Hardware                        |
| --------- | --------------------------- | ------------------------------- |
| `zenbook` | NixOS (x86_64-linux)        | ASUS Zenbook UX3405M            |
| `mbp14`   | nix-darwin (aarch64-darwin) | MacBook Pro 14" (Apple Silicon) |

## Structure

```
hosts/          # Machine-specific configuration (system, users, hardware)
modules/
  shared/       # Cross-platform modules (dev tools, neovim, utilities)
  nixos/        # Linux-only modules (Hyprland, laptop, theming)
  darwin/       # macOS-only modules (Homebrew)
secrets/        # age-encrypted secrets (WireGuard, etc.)
```

## Key Design Choices

- **Dotfiles are external** — `nvim`, `fish`, `tmux`, `ghostty` configs live in [helvnor/dotfiles](https://github.com/helvnor/dotfiles), pulled in as a flake input and deployed via `home.file.*.source`
- **Secrets via agenix** — encrypted with age, keys defined per-host in `secrets.nix`
- **`nixpkgs` tracks `nixos-unstable`** — rolling release on both machines

## Desktop (Zenbook)

Hyprland (Wayland) + Noctalia shell (launcher + lock screen)

## Applying

```sh
# NixOS
sudo nixos-rebuild switch --flake .#zenbook

# macOS
darwin-rebuild switch --flake .#mbp14
```
