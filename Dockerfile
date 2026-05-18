FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update && apt-get install -y libpq-dev gcc && rm -rf /var/lib/apt/lists/*

ARG ARTIFACT_NAME
COPY ${ARTIFACT_NAME} /tmp/app.tar.gz
RUN tar -xzf /tmp/app.tar.gz -C /app && rm /tmp/app.tar.gz

RUN pip install --upgrade pip && pip install -r /app/requirements.txt

EXPOSE 8000
CMD ["gunicorn", "book_shop.wsgi:application", "--bind", "0.0.0.0:8000"]