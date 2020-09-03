FROM ubuntu
RUN apt-get update -qq
RUN apt-get -y install python3.6
RUN apt-get -y install python3-pip
ADD simpleApp /simpleApp
ADD requirements.txt /simpleApp
WORKDIR /simpleApp
RUN pip3 install -r requirements.txt
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate
RUN python3.6 manage.py runserver 0.0.0.0:8000
CMD ["/bin/bash"]
