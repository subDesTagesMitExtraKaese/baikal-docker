FROM python:3.15-alpine@sha256:0f9552bb28711333da16915ec146f5e6bb44a7fdac9ced15dc17c2e0206346dd

RUN pip install aiosmtpd==1.4.6 aiohttp==3.14.5

COPY mail_server.py mail_server.py
CMD ["python", "mail_server.py"]
