FROM python:3.7-alpine

COPY requirements.txt /
COPY main.py /

RUN pip3 install -r requirements.txt

ENV FLASK_APP main.py

ENTRYPOINT [ "python3" ]

CMD [ "main.py" ]