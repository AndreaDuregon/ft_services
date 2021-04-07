FROM alpine:latest

EXPOSE 3000

RUN apk update
RUN apk add libc6-compat



RUN cd opt/
RUN wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana-3.1.1-1470047149.linux-x64.tar.gz
RUN tar -zxvf grafana-3.1.1-1470047149.linux-x64.tar.gz
RUN rm grafana-3.1.1-1470047149.linux-x64.tar.gz
COPY setup.sh ./setup.sh
RUN	chmod 777 ./setup.sh
CMD ./setup.sh
