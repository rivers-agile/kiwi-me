FROM kiwitcms/kiwi:6.1.1

COPY ./httpd.conf /etc/httpd/conf/
COPY ./kiwi-httpd.conf /etc/httpd/conf.d/

COPY ./with_ssl.py ./venv/lib/python3.6/site-packages/tcms/settings/
RUN sed -i "s/tcms.settings.product/tcms.settings.with_ssl/" /Kiwi/manage.py
