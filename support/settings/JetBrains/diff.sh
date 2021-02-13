export JETBRAINS_HOME=~/"Library/Application Support/JetBrains"
export IDEA_HOME="$JETBRAINS_HOME/IntelliJIdea2020.3"
export MINE_HOME="$JETBRAINS_HOME/RubyMine2020.3"

export CODE_BUDDY_PLUGIN_HOME=~/"Development/intellij/code-buddy-plugin"
export RUBY_CONVENTIONS_PLUGIN_HOME=~/"Development/intellij/ruby-conventions-plugin"

export DOTFILES_JETBRAINS_HOME=~/"dotfiles/support/settings/JetBrains"

function diff_keymaps {
  idea diff "$IDEA_HOME/jba_config/mac.keymaps/CodeBuddyKeymap.xml" \
            "$MINE_HOME/jba_config/mac.keymaps/macOS _custom_.xml"
}

function diff_plugins {
  idea diff "$IDEA_HOME/jba_config/installed_plugins.txt" \
            "$MINE_HOME/jba_config/installed_plugins.txt"
}

function keymap_stat {
  stat -f "%m%t%Sm %N" $JETBRAINS_HOME/*/jba_config/mac.keymaps/CodeBuddyKeymap.xml \
    | sort -rn | head -3 | cut -f2-
}


diff_keymaps
