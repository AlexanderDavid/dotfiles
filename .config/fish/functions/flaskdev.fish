# Defined in - @ line 1
function flaskdev --wraps='export FLASK_ENV=development && pipenv run flask run' --description 'alias flaskdev=export FLASK_ENV=development && pipenv run flask run'
  export FLASK_ENV=development && pipenv run flask run $argv;
end
