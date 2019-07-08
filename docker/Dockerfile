FROM silex/emacs:latest

RUN apt-get update

RUN apt-get install -y git openjdk-11-jdk

RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 \
    && apt-get update \
    && apt-get install sbt

RUN curl -L -o coursier https://git.io/coursier \
    && chmod +x coursier \
    && ./coursier bootstrap \
       --java-opt -Xss4m \
       --java-opt -Xms100m \
       --java-opt -Dmetals.client=emacs \
       org.scalameta:metals_2.12:0.7.0 \
       -r bintray:scalacenter/releases \
       -r sonatype:snapshots \
       -o /usr/local/bin/metals-emacs -f

RUN mkdir /root/.emacs.d

RUN mkdir /scala

COPY input.txt /scala/input.txt

RUN cd /scala && sbt new scala/scala-seed.g8 < /scala/input.txt

# RUN echo "export TERM=xterm-256color" >> ~/.bashrc

CMD /bin/bash
