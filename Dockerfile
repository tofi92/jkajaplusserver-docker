# syntax=docker/dockerfile:1
FROM debian:stable-slim
EXPOSE 29070/udp
EXPOSE 29070/tcp
RUN apt-get update && apt-get install -y wget unzip bash libc6-i386 lib32stdc++6 lib32gcc-s1 lib32z1 procps
RUN mkdir ja && wget https://files.jkhub.org/jka/official/jalinuxded_1.011.zip \
&& unzip jalinuxded_1.011.zip -d ja \
&& rm jalinuxded_1.011.zip \
&& wget https://files.jkhub.org/jka/code/server/japlus_v2.4Build7.zip \
&& unzip -o japlus_v2.4Build7.zip -d ja \
&& rm japlus_v2.4Build7.zip
WORKDIR /ja
COPY ["start_server.sh", "start_server.sh"]
RUN cp japlus/jampgamei386.so base/jampgamei386.so \
&& cp libcxa.so.1 /usr/lib/libcxa.so.1 \
&& chmod a+x linuxjampded \
&& mkdir japluscfg && mkdir assets \
&& chmod a+x start_server.sh \
&& rm start_japlus_linux_autoRestart.sh
COPY ["start_japlus_linux_autoRestart.sh", "start_japlus_linux_autoRestart.sh"]
RUN chmod a+x start_japlus_linux_autoRestart.sh

CMD ["./start_server.sh"]