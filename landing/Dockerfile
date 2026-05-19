FROM python:3.11-slim

WORKDIR /app

COPY server.py .
COPY index.html /usr/share/nginx/html/
COPY legal/privacy.html /usr/share/nginx/html/privacy.html
COPY legal/terms.html /usr/share/nginx/html/terms.html
COPY legal/support.html /usr/share/nginx/html/support.html

CMD ["python", "server.py"]
