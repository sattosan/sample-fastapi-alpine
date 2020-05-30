FROM python:3.8-alpine

WORKDIR /app

ADD requirements.txt .

# コンテナ内で必要なパッケージをインストール
RUN apk add --no-cache build-base mariadb-connector-c-dev
# requirements.txtにリストされたパッケージをインストールする
RUN pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

ADD main.py .
# FastAPIを8000ポートで待機
CMD ["uvicorn", "main:app", "--reload", "--host", "0.0.0.0", "--port", "8000"]