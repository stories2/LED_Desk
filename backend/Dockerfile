FROM python:3.9.9

EXPOSE 5000

RUN pip3 install flask==2.0.2
RUN pip3 install RPi.GPIO==0.7.0
RUN pip3 install Adafruit-Blinka==6.18.0
RUN pip3 install rpi-ws281x==4.3.1

WORKDIR /app

RUN pip3 freeze > requirements.txt

COPY src .

CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]