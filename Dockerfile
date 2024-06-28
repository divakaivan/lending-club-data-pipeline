FROM python:3.11

WORKDIR /app

RUN pip install --upgrade pip && \
    pip install mage-ai google-cloud-bigquery google-cloud-storage db-dtypes kaggle

COPY mage/ ./mage/
COPY terraform/keys/my-creds.json /app/mage/keys/my-creds.json
COPY terraform/keys/kaggle.json /root/.kaggle/kaggle.json

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]