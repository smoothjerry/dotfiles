# dotfiles
Configurations for macOS development

## Supported tools
* **starship** - cli prompt
* **ghostty** - terminal emulator
* **raycast** - extensible "spotlight" tool
* **claude** - ai coding assistant (Claude Code)
* **git** - version control
* **zoxide** - smarter `cd` with frecency-based directory jumping (`z`)
* **worktrunk** - git worktree manager (`wt`)
* **betterdisplay** - fine-grain display control
* **scroll-reverser** - control mouse/trackpad scrolling

## Setup

This repository uses [GNU Stow](https://www.gnu.org/software/stow/) to manage symlinks for dotfiles.

### Prerequisites

1. Install Homebrew (if not already installed):
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. Install packages from Brewfile:
   ```bash
   brew bundle
   ```

### Setting up dotfiles

1. Clone this repository (or navigate to it if already cloned):
   ```bash
   cd ~/projects/dotfiles
   ```

2. Use stow to create symlinks for each configuration:
   ```bash
   # Starship prompt
   stow --target="$HOME" starship
   
   # Ghostty terminal
   stow --target="$HOME" ghostty

   # Claude Code
   stow --target="$HOME" claude

   # Zsh (includes zoxide and worktrunk shell init)
   stow --target="$HOME" zsh

   # Worktrunk global config
   stow --target="$HOME" worktrunk
   ```

   Or stow all packages at once:
   ```bash
   stow --target="$HOME" starship ghostty claude zsh worktrunk
   ```

   **Note for claude:** If `~/.claude/settings.json` already exists, use `stow --adopt --target="$HOME" claude` to adopt the existing file into the repo, then review changes with `git diff`.

   **Note for scroll-reverser and betterdisplay:**

   These apps don't support straightforward config files, so it's best just to play around with their GUIs after install to fix them to your liking.

3. Set up Git configuration:
   
   The git config uses an include approach to allow machine-specific settings. Add this to your `~/.gitconfig`:
   ```ini
   [include]
       path = ~/projects/dotfiles/git/.gitconfig
   ```
   
   You can also add machine-specific settings (like `user.name`, `user.email`, `commit.gpgsign`) in your `~/.gitconfig` above the include line.

### Managing dotfiles

- **Restow a package** (update symlinks after changes):
  ```bash
  stow --target="$HOME" --restow <package>
  ```

- **Unstow a package** (remove symlinks):
  ```bash
  stow --target="$HOME" --delete <package>
  ```

- **Check what would be stowed** (dry run):
  ```bash
  stow --target="$HOME" --simulate <package>
  ```