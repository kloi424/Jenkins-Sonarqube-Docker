From nginx
copy . /usr/share/nginx/html/

COPY nginx/default.conf /etc/nginx/conf.d/default.conf
