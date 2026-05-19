FROM nginx:alpine

COPY index.html /usr/share/nginx/html/
COPY legal/privacy.html /usr/share/nginx/html/privacy.html
COPY legal/terms.html /usr/share/nginx/html/terms.html
COPY legal/support.html /usr/share/nginx/html/support.html

RUN echo 'server { \
    listen 80; \
    root /usr/share/nginx/html; \
    index index.html; \
    location / { try_files $uri $uri.html /index.html; } \
}' > /etc/nginx/conf.d/default.conf

# Railway uses PORT env var, but nginx listens on 80 inside container
# Railway maps external PORT to container port automatically for Docker deployments
# If that doesn't work, we can use a shell script to listen on $PORT

RUN echo '#!/bin/sh\n\
PORT=${PORT:-80}\n\
sed -i "s/listen 80/listen $PORT/g" /etc/nginx/conf.d/default.conf\n\
nginx -g "daemon off;"\n\
' > /entrypoint.sh && chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
