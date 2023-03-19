FROM python:3.10-slim

RUN apt-get update && \
    apt-get install ffmpeg curl -y && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m appuser
USER appuser
WORKDIR /home/appuser/
RUN mkdir usage_logs
ENV PATH="/home/appuser/.local/bin:$PATH"

RUN pip install --user pipenv --no-cache-dir
COPY --chown=appuser:appuser Pipfile* ./
RUN pipenv install --system --deploy --ignore-pipfile

COPY --chown=appuser:appuser health.sh ./

COPY --chown=appuser:appuser app ./
CMD ["python", "main.py"]
