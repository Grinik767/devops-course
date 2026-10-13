FROM python:3.14-slim
WORKDIR /app
RUN apt-get update
RUN apt-get install -y gcc libpq-dev
COPY . .
RUN pip install -r App/requirements.txt
RUN rm -rf /root/.cache/pip
RUN apt-get remove -y gcc libpq-dev && apt-get autoremove -y
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
WORKDIR /app/App
CMD ["python", "app.py"]
