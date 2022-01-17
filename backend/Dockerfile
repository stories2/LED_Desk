FROM python:3.9.9

EXPOSE 5000

RUN pip3 install flask 

WORKDIR /app
COPY ../notebook/requirements.txt ./

RUN pip3 freeze > requirements.txt

COPY src .

CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]