FROM python:3.12-alpine3.20

WORKDIR /app

# install psycopg2 dependencies (needed for alpine version)
RUN apk update \
    && apk add postgresql-dev gcc python3-dev musl-dev

COPY requirements.txt .

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

ENTRYPOINT ["python", "main.py"]