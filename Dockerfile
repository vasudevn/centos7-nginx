FROM centos:7
MAINTAINER vasudevn "npadma09@gmail.com"
RUN yum install epel-release -y
RUN yum install nginx -y
RUN systemctl enable nginx
ADD nginx/nginx.conf /etc/nginx/nginx.conf
ADD nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
ADD data/www /data/www
RUN rm /etc/nginx/sites-enabled/default
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log
EXPOSE 80 443
systemctl restart nginx
CMD ["nginx", "-g", "daemon off;"]

