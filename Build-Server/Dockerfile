# use a node base image
FROM python:3

COPY microhttp.py ./app/
WORKDIR /app

CMD [ "python", "./microhttp.py" ]

# tell docker what port to expose
EXPOSE 80
