FROM python:3.6
RUN apt-get update -qq
RUN apt-get -qqy install python3-pip

ADD simpleApp /simpleApp
WORKDIR /simpleApp
ADD requirements.txt ./

RUN pip3 install -r requirements.txt
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate
COPY . .

EXPOSE 8000
CMD [python3.6 manage.py runserver 0.0.0.0:8000]
