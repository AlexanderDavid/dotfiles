# Defined in /tmp/fish.UT0eh8/show_virtualenv_name.fish @ line 2
function show_virtualenv_name --description 'Display the name of the current virtualenv'

    if set -q VIRTUAL_ENV
	echo -en "["(basename "$VIRTUAL_ENV" | sed 's/-.*//')"] "
    end
end
