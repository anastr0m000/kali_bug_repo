FROM thuonghai2711/kali-novnc-v2:latest
ENV DEBIAN_FRONTEND noninteractive

RUN apt update  && apt install nano assetfinder -y
RUN  cp /root/noVNC/vnc.html /root/noVNC/index.html
RUN rm entrypoint.sh
COPY entrypoint.sh entrypoint.sh
#COPY blu.sh blu.sh
RUN chmod +x entrypoint.sh
#RUN chmod +x blu.sh
#RUN ./blu.sh

ARG GOLANG_VERSION=1.23.0
RUN apt-get remove golang-go -y 
RUN rm -rvf /usr/local/go
RUN wget https://dl.google.com/go/go${GOLANG_VERSION}.linux-amd64.tar.gz
RUN tar -xvf go${GOLANG_VERSION}.linux-amd64.tar.gz
RUN mv go /usr/local

#ENV GOROOT /usr/local/go
#ENV GOPATH /go
#ENV PATH /go/bin:$PATH
#RUN wget https://go.dev/dl/go${GOLANG_VERSION}.linux-amd64.tar.gz && \
#    rm -rf /usr/local/go && tar -C /usr/local -xzf go${GOLANG_VERSION}.linux-amd64.tar.gz && \
#    rm go${GOLANG_VERSION}.linux-amd64.tar.gz
#ENV PATH="${PATH}:/usr/local/go/bin"
ENV GOROOT=/usr/local/go
ENV GOPATH=/root/go
ENV PATH=$GOPATH/bin:$GOROOT/bin:$PATH
RUN go version
#COPY blu.sh blu.sh
#RUN chmod +x blu.sh
#RUN ./blu.sh
#RUN go install github.com/projectdiscovery/katana/cmd/katana@latest
RUN go install -v github.com/tomnomnom/anew@latest
RUN go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
# RUN go install -v github.com/owasp-amass/amass/v4/...@master
# RUN go install github.com/tomnomnom/gf@latest 
# RUN git clone https://github.com/rix4uni/gf-patterns.git ~/.gf

# #RUN go install -u github.com/tomnomnom/gf
# RUN GO111MODULE=on go install github.com/jaeles-project/gospider@latest
# RUN go install github.com/hakluke/hakrawler@latest
# RUN go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
# #RUN go get -u github.com/tomnomnom/assetfinder
# RUN go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
# RUN go install github.com/tomnomnom/waybackurls@latest
# RUN go install github.com/lc/gau/v2/cmd/gau@latest
# RUN go install github.com/hahwul/dalfox/v2@latest
# RUN go install -v github.com/projectdiscovery/uncover/cmd/uncover@latest
# RUN go install -v github.com/owasp-amass/amass/v4/...@master

# RUN cp /root/go/bin/* /usr/bin/
# RUN apt clean && \
#     rm -rf /var/lib/apt/lists/*
# COPY blu.sh blu.sh
# RUN chmod +x blu.sh
# RUN ./blu.sh

# RUN pip3 install git+https://github.com/guelfoweb/knock.git
# RUN pip3 install waymore arjun dirsearch
# COPY blue2.sh blue2.sh
# RUN chmod +x blue2.sh
# RUN ./blue2.sh

EXPOSE 6080:5900
ENTRYPOINT ["./entrypoint.sh"]
