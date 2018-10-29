FROM kiwitcms/kiwi:6.1.1

COPY ./httpd.conf /etc/httpd/conf/
COPY ./kiwi-httpd.conf /etc/httpd/conf.d/
