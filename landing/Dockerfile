FROM python:3.11-alpine
WORKDIR /app
COPY . /app
RUN rm -f /app/Dockerfile /app/railway.json /app/nginx.conf 2>/dev/null || true
EXPOSE 80
CMD ["sh", "-c", "python -m http.server ${PORT:-80}"]
