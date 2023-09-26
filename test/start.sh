cd src
gunicorn --certfile ../cert.pem --keyfile ../key.pem -b 0.0.0.0:9100 iam:app
