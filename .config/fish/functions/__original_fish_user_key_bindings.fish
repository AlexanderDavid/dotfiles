# Defined in /tmp/fish.yNQLbJ/__original_fish_user_key_bindings.fish @ line 2
function __original_fish_user_key_bindings
  test -f $OMF_CONFIG/theme
    and read -l theme < $OMF_CONFIG/theme
    or set -l theme default
  test -e $OMF_CONFIG/key_bindings.fish;
    and source $OMF_CONFIG/key_bindings.fish
  # Prepare packages key bindings paths
  set -l key_bindings {$OMF_CONFIG,$OMF_PATH}/pkg/*/key_bindings.fish \
                      {$OMF_CONFIG,$OMF_PATH}/themes*/$theme/key_bindings.fish
  # Source all keybindings collected
  for file in $key_bindings
    source $file
  end
  # Call original key bindings if existent
end
