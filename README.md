# Kiwi Me

_An attempt to make the "off the shelf" Kiwi TCMS Docker image work with Heroku_

### `kiwi-httpd.conf`

**Source:** [Github repo](https://github.com/kiwitcms/Kiwi/blob/master/etc/kiwi-httpd.conf)

**Changes:**

- Removed the `mod_ssl` configuration (SSL is configured and handled by Heroku)

  ```
    #  <IfModule mod_ssl.c>
    #     <VirtualHost _default_:8443>
    #         SSLEngine on
    #
    #         # override default certificate locations from ssl.conf
    #         SSLCertificateFile    /Kiwi/ssl/localhost.crt
    #         SSLCertificateKeyFile /Kiwi/ssl/localhost.key
    #     </VirtualHost>
    # </IfModule>
  ```

- Removed the SSL rewrite (this would cause an infinite redirect loop, as Heroku forwards only HTTP)

  ```
    # Force the use of ssl:
    # <IfModule mod_rewrite.c>
    #     RewriteEngine on
    #     RewriteCond %{HTTPS} off
    #     RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI}
    # </IfModule>
  ```

### `httpd.conf`

**Source:** A running container (the upstream maintainer `sed`s the file repeatedly)

**Changes:**

- Bind Apache to the `PORT` env var provided by Heroku

  ```
    Listen 0.0.0.0:${PORT}
  ```

- Allow Apache user/group to use defaults (same use that started, which is convention for Heroku)

  ```
    # User apache
    # Group apache
  ```
