FROM python:3.14-slim

ENV PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1

RUN useradd --uid 10001 --no-create-home --shell /usr/sbin/nologin appuser
WORKDIR /app
COPY App/requirements.txt ./requirements.txt
RUN pip install -r requirements.txt
COPY --chown=appuser:appuser App/ .
USER appuser
EXPOSE 8000
CMD ["python", "app.py"]