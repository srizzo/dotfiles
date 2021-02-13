export JETBRAINS_HOME=~/"Library/Application Support/JetBrains"
export IDEA_HOME="$JETBRAINS_HOME/IntelliJIdea2021.1"
export MINE_HOME="$JETBRAINS_HOME/RubyMine2021.1"

export CODE_BUDDY_PLUGIN_HOME=~/"Development/intellij/code-buddy-plugin"
export RUBY_CONVENTIONS_PLUGIN_HOME=~/"Development/intellij/ruby-conventions-plugin"
export RSPEC_PLUGIN_HOME=~/"Development/intellij/rspector-rubymine-plugin"

export DOTFILES_JETBRAINS_HOME=~/"dotfiles/support/settings/JetBrains"
export DOTFILES_SHARED_HOME="$DOTFILES_JETBRAINS_HOME/_shared"
export DOTFILES_IDEA_HOME="$DOTFILES_JETBRAINS_HOME/IntelliJIdea2021.1"
export DOTFILES_MINE_HOME="$DOTFILES_JETBRAINS_HOME/RubyMine2021.1"

function idea_keymaps_dist {
  rsync -av --delete --prune-empty-dirs --include="*/" \
                                        --include="mac.keymaps/*" \
                                        --exclude="*" \
    "$IDEA_HOME"/ \
    "$DOTFILES_SHARED_HOME"

  cp "$DOTFILES_SHARED_HOME/jba_config/mac.keymaps/CodeBuddy _macOS_ Source.xml" \
     "$CODE_BUDDY_PLUGIN_HOME/build/idea-sandbox/config/keymaps/CodeBuddy _macOS_ Source.xml"
  cp "$DOTFILES_SHARED_HOME/jba_config/mac.keymaps/CodeBuddy _macOS_ Source.xml" \
     "$RUBY_CONVENTIONS_PLUGIN_HOME/build/idea-sandbox/config/keymaps/CodeBuddy _macOS_ Source.xml"
}

function jetbrains_to_dotfiles {
  rsync -av --delete --prune-empty-dirs --include="*/" \
                                        --include="installed_plugins.txt" \
                                        --include="customization.xml" \
                                        --include="rubyconventions-*" \
                                        --include="rspector-*" \
                                        --include="codebuddy-*" \
                                        --include="mac.keymaps/*" \
                                        --exclude="*" \
    "$IDEA_HOME"/ \
    "$DOTFILES_IDEA_HOME"

  rsync -av --delete --prune-empty-dirs --include="*/" \
                                        --include="installed_plugins.txt" \
                                        --include="customization.xml" \
                                        --include="rubyconventions-*" \
                                        --include="rspector-*" \
                                        --include="codebuddy-*" \
                                        --include="mac.keymaps/*" \
                                        --exclude="*" \
    "$MINE_HOME"/ \
    "$DOTFILES_MINE_HOME"
}

function plugins_dist_to_dotfiles {
  mkdir -p "$DOTFILES_JETBRAINS_HOME/_shared/plugins"
  rm -rf "$DOTFILES_JETBRAINS_HOME/_shared/plugins"/*

  unzip "$(ls -t "$CODE_BUDDY_PLUGIN_HOME/build/distributions/codebuddy-"* | head -1)" \
    -d "$DOTFILES_SHARED_HOME/plugins"
  unzip "$(ls -t "$RUBY_CONVENTIONS_PLUGIN_HOME/build/distributions/rubyconventions-"* | head -1)" \
    -d "$DOTFILES_SHARED_HOME/plugins"
  unzip "$(ls -t "$RSPEC_PLUGIN_HOME/build/distributions/rspector-"* | head -1)" \
    -d "$DOTFILES_SHARED_HOME/plugins"
}

function install_plugins {
  rsync -v -a --delete --prune-empty-dirs \
      "$DOTFILES_SHARED_HOME/plugins/codebuddy/" \
      "$IDEA_HOME/plugins/codebuddy"


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

idea_keymaps_dist
plugins_dist_to_dotfiles
install_plugins
jetbrains_to_dotfiles

# git add . && git commit --amend --reuse-message=HEAD && git push --force
