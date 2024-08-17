FROM quay.io/anastr0m000/go_tool:latest  as builder
FROM thuonghai2711/kali-novnc-v2:latest AS final-stage  
WORKDIR /
ENV DEBIAN_FRONTEND noninteractive
RUN apt update && apt install nano assetfinder libpcap-dev -y
RUN  cp /root/noVNC/vnc.html /root/noVNC/index.html
RUN rm entrypoint.sh
COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh
ARG GOLANG_VERSION=1.23.0
RUN apt-get remove golang-go -y 
RUN rm -rvf /usr/local/go
RUN wget https://dl.google.com/go/go${GOLANG_VERSION}.linux-amd64.tar.gz
RUN tar -xvf go${GOLANG_VERSION}.linux-amd64.tar.gz
RUN mv go /usr/local
ENV GOROOT=/usr/local/go
ENV GOPATH=/root/go
ENV PATH=$GOPATH/bin:$GOROOT/bin:$PATH
RUN go version
COPY blu.sh blu.sh
RUN chmod +x blu.sh
RUN ./blu.sh
RUN pip3 install waymore arjun dirsearch
COPY blue2.sh blue2.sh
RUN chmod +x blue2.sh
COPY --from=builder /go/bin/* /usr/bin/
RUN ls -al /usr/bin/
# WORKDIR /
RUN pip3 install git+https://github.com/guelfoweb/knock.git
RUN rm go${GOLANG_VERSION}.linux-amd64.tar.gz
RUN ./blue2.sh
# RUN apt upgrade -y
RUN apt clean && \
    rm -rf /var/lib/apt/lists/*
COPY auto.sh auto.sh
RUN chmod +x auto.sh
EXPOSE 6080:5900
ENTRYPOINT ["./entrypoint.sh"]
