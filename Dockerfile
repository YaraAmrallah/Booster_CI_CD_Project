FROM python:3.6-alpine
RUN apt-get update -qq
RUN apt-get -qqy install python3-pip

ADD . /simpleApp
WORKDIR /simpleApp

RUN pip install -r requirements.txt
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate
COPY . .

EXPOSE 8000
CMD [python3.6 manage.py runserver 0.0.0.0:8000]
