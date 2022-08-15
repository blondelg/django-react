#!/bin/sh
python /code/myproject/manage.py migrate
python /code/myproject/manage.py runserver 0.0.0.0:8000