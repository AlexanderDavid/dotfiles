patterns = ['make: *** [Makefile:45: install] Error 1']


def match(command):
    if command.script_parts and '&&' not in command.script_parts and command.script_parts[0] == 'sudo':
        return False

    for pattern in patterns:
        if pattern in command.output.lower():
            return True
    return False


def get_new_command(command):
    if '&&' in command.script:
        return u'sudo sh -c "{}"'.format(" ".join([part for part in command.script_parts if part != "sudo"]))
    elif '>' in command.script:
        return u'sudo sh -c "{}"'.format(command.script.replace('"', '\\"'))
    else:
        return u'sudo {}'.format(command.script)
