FROM centos:centos7
MAINTAINER vasudevn "npadma09@gmail.com"
RUN yum -y update --nogpgcheck
RUN  yum clean all
#RUN yum install nginx -y
RUN rpm -ivh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
RUN yum install -y nginx --nogpgcheck
RUN systemctl enable nginx
ADD nginx/nginx.conf /etc/nginx/nginx.conf
ADD nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
ADD data/www /data/www
#RUN rm /etc/nginx/sites-enabled/default
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log
EXPOSE 80 443
systemctl restart nginx
CMD ["nginx", "-g", "daemon off;"]

