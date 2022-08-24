FROM python:3.10-alpine
RUN apk update && apk add libpq-dev build-base
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /code
COPY backend/requirements /code/requirements
RUN pip install --upgrade pip
RUN pip install -r requirements/dev.txt
COPY ./backend /code/