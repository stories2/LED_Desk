FROM python:3.9.9

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install python3-pip python3-dev -y
RUN pip3 install jupyter

ENV CFLAGS -fcommon
RUN pip3 install RPi.GPIO 
#RUN apt install python-rpi.gpio -y
#RUN apt install -y python3-pip python3-dev
#RUN pip3 install RPi.GPIO jupyter

EXPOSE 8888

RUN mkdir /notebook
WORKDIR /notebook

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--NotebookApp.token=", "--allow-root"]
