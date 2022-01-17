FROM python:3.9.9

EXPOSE 5000

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install python3-pip python3-dev -y

ENV CFLAGS -fcommon

RUN pip3 install flask==2.0.2
RUN pip3 install RPi.GPIO==0.7.0
RUN pip3 install adafruit-circuitpython-neopixel==6.2.3
RUN pip3 install rpi-ws281x==4.3.1

WORKDIR /app

RUN pip3 freeze > requirements.txt

COPY src .

CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]