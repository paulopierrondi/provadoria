FROM nginx:alpine

COPY index.html /usr/share/nginx/html/
COPY legal/privacy.html /usr/share/nginx/html/privacy
COPY legal/terms.html /usr/share/nginx/html/terms
COPY legal/support.html /usr/share/nginx/html/support

RUN echo 'server { \
    listen ${PORT:-80}; \
    location / { root /usr/share/nginx/html; try_files $uri $uri.html /index.html; } \
    location /privacy { root /usr/share/nginx/html; try_files /privacy.html =404; } \
    location /terms { root /usr/share/nginx/html; try_files /terms.html =404; } \
    location /support { root /usr/share/nginx/html; try_files /support.html =404; } \
}' > /etc/nginx/conf.d/default.conf

CMD sed -i "s/\${PORT:-80}/\${PORT:-80}/g" /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'
