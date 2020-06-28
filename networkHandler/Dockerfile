FROM python:3.8-slim-buster

COPY requirements.txt /
ADD main.py /

RUN apt-get update && apt-get install -y iputils-ping
RUN pip3 install -r requirements.txt

ENV FLASK_APP main.py

ENTRYPOINT [ "python3" ]

CMD [ "main.py" ]