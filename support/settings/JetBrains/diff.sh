export JETBRAINS_HOME=~/"Library/Application Support/JetBrains"
export IDEA_HOME="$JETBRAINS_HOME/IntelliJIdea2021.1"
export MINE_HOME="$JETBRAINS_HOME/RubyMine2021.1"

export CODE_BUDDY_PLUGIN_HOME=~/"Development/intellij/code-buddy-plugin"
export RUBY_CONVENTIONS_PLUGIN_HOME=~/"Development/intellij/ruby-conventions-plugin"

export DOTFILES_JETBRAINS_HOME=~/"dotfiles/support/settings/JetBrains"

function diff_rubymine_keymaps {
  idea diff "$IDEA_HOME/jba_config/mac.keymaps/CodeBuddy _macOS_ Source.xml" \
            "$MINE_HOME/jba_config/mac.keymaps/CodeBuddy _macOS_ RubyMine.xml"
}



function diff_source_with_codebuddy_keymaps {
  idea diff "$IDEA_HOME/jba_config/mac.keymaps/CodeBuddy _macOS_ Source.xml" \
            "/Users/ralphus/Development/intellij/code-buddy-plugin/src/main/resources/keymaps/CodeBuddy (macOS).xml"
            # "/Users/ralphus/dotfiles/support/settings/JetBrains/_shared/jba_config/mac.keymaps/CodeBuddyKeymap.xml"
}

function diff_old_with_codebuddy_keymaps {
  idea diff "/Users/ralphus/Development/intellij/code-buddy-plugin/src/main/resources/keymaps/CodeBuddy (macOS).xml" \
            "/Users/ralphus/dotfiles/support/settings/JetBrains/_shared/jba_config/mac.keymaps/CodeBuddyKeymap.xml"
}


function diff_plugins {
  idea diff "$IDEA_HOME/jba_config/installed_plugins.txt" \
            "$MINE_HOME/jba_config/installed_plugins.txt"
}

function keymap_stat {
  stat -f "%m%t%Sm %N" "$JETBRAINS_HOME/*/jba_config/mac.keymaps/CodeBuddy _macOS_ Source.xml" \
    | sort -rn | head -3 | cut -f2-
}


diff_old_with_codebuddy_keymaps
