export JETBRAINS_HOME=~/"Library/Application Support/JetBrains"
export MINE_HOME="$JETBRAINS_HOME/RubyMine2021.1"

export CODE_BUDDY_PLUGIN_HOME=~/"Development/intellij/code-buddy-plugin"
export RUBY_CONVENTIONS_PLUGIN_HOME=~/"Development/intellij/ruby-conventions-plugin"
export RSPEC_PLUGIN_HOME=~/"Development/intellij/rspector-rubymine-plugin"

export DOTFILES_JETBRAINS_HOME=~/"dotfiles/support/settings/JetBrains"
export DOTFILES_SHARED_HOME="$DOTFILES_JETBRAINS_HOME/_shared"
export DOTFILES_MINE_HOME="$DOTFILES_JETBRAINS_HOME/RubyMine2021.1"

function mine_install_plugins {
  rsync -v -a --delete --prune-empty-dirs \
      "$DOTFILES_SHARED_HOME/plugins/codebuddy/" \
      "$MINE_HOME/plugins/codebuddy"

  rsync -v -a --delete --prune-empty-dirs \
      "$DOTFILES_SHARED_HOME/plugins/rubyconventions/" \
      "$MINE_HOME/plugins/rubyconventions"

  rsync -v -a --delete --prune-empty-dirs \
      "$DOTFILES_SHARED_HOME/plugins/rspector/" \
      "$MINE_HOME/plugins/rspector"
}

mine_install_plugins
