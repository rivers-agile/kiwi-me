from .product import *

SECURE_SSL_REDIRECT = True
SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')
MIDDLEWARE.append('django.middleware.security.SecurityMiddleware')
