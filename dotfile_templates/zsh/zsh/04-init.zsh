# Combine abbreviations as abbr only loads one file
cat ~/.config/zsh/abbreviations_common > ~/.config/zsh/abbreviations
cat ~/.config/zsh/abbreviations_work >> ~/.config/zsh/abbreviations

# Load abbreviations
abbr load

# 1Password Agent Link
if test -f ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock; then
  mkdir -p ~/.1password && ln -s ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock ~/.1password/agent.sock
fi

if test -f /opt/homebrew/opt/asdf/libexec/asdf.sh; then
  source $(brew --prefix asdf)/libexec/asdf.sh
fi

if test -f ~/.orbstack/shell/init.zsh; then
  . ~/.orbstack/shell/init.zsh 2>/dev/null || :
fi

if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

if command -v alacritty &> /dev/null; then
  if test ! -d ~/.config/alacritty/themes; then
    git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
  fi
fi

if command -v tmux &> /dev/null; then
  if test ! -d ~/.config/tmux/plugins/tpm; then
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
    tmux source ~/.config/tmux/tmux.conf
  fi

  if test -d ~/.config/tmux/plugins/tmux-colors-solarized; then
    # echo "gsed -i 's/catppuccin_latte/catppuccin_frappe/' ~/.config/alacritty/alacritty.yml" >> ~/.config/tmux/plugins/tmux-colors-solarized/tmuxcolors-dark.conf
    # echo "gsed -i 's/catppuccin_frappe/catppuccin_latte/' ~/.config/alacritty/alacritty.yml" >> ~/.config/tmux/plugins/tmux-colors-solarized/tmuxcolors-light.conf
  fi
fi

if test -f "/Applications/Visual Studio Code.app"; then
  code version use oss --install-dir "/Applications/Visual Studio Code.app"
fi

# Configure PNPM
# pnpm
export PNPM_HOME="~/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
