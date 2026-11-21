FROM python:3.14-alpine

RUN pip install aiosmtpd==1.4.6 aiohttp==3.14.5

COPY mail_server.py mail_server.py
CMD ["python", "mail_server.py"]
