REM activate the virtualenv
call C:\venv\Scripts\activate.bat

REM do all the django preparation things
cd C:\source
python manage.py migrate
python manage.py collectstatic --noinput

REM pipe a command given for docker run
call %*