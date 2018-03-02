FROM ubuntu
RUN apt-get update
RUN apt-get install -y apache2 && apt-get clean
RUN echo "ServerName localhost"| tee /etc/apache2/conf-available/fqdn.conf
RUN a2enconf fqdn
RUN rm /var/www/html/index.html
COPY . /var/www/html/
EXPOSE 80
CMD /var/www/html/app.sh && apachectl -D FOREGROUND
