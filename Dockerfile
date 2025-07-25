FROM node:14.16.1-alpine3.10 AS base
WORKDIR /var/www/

FROM base AS contact-service
ADD  services/contact/ .
RUN npm install --only=production 
CMD [ "node", "app.js" ]

FROM base AS order-service
ADD  services/order/ .
RUN npm install --only=production 
CMD [ "node", "app.js" ]

FROM base AS shipping-service
ADD  services/shipping/ .
RUN npm install --only=production 
CMD [ "node", "app.js" ]

FROM python:3.9-alpine AS report-python-service
WORKDIR /var/www/
ADD services/report-python/ .
RUN pip install --no-cache-dir -r requirements.txt
# Desabilitar buffering do Python para logs em tempo real
ENV PYTHONUNBUFFERED=1
ENV PYTHONIOENCODING=UTF-8
CMD [ "python", "-u", "app.py" ]
