FROM java

COPY ./soft/* /opt/

RUN cd /opt && \
    tar -xzvf zookeeper-3.4.6.tar.gz && \
    mv zookeeper-3.4.6 zookeeper && \
    mkdir -p data/1/log && mkdir -p data/2/log && \
    mkdir -p data/3/log && \
    echo 1 > data/1/myid && \
    echo 2 > data/2/myid && \
    echo 3 > data/3/myid && \
    mv *.cfg zookeeper/conf/ && \
    mv *.sh  zookeeper/bin/ && \
    rm zookeeper-3.4.6.tar.gz && \
    ls

WORKDIR /opt/zookeeper/bin

CMD ["sh","start.sh"]

EXPOSE 2181 2182 2183 2887 2888 2889 3887 3888 3889
