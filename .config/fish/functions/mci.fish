# Defined in - @ line 1
function mci --wraps='sudo make clean install' --description 'alias mci=sudo make clean install'
  sudo make clean install $argv;
end
