# syntax=docker/dockerfile:1
FROM debian:stable-slim
EXPOSE 29070/udp
EXPOSE 29070/tcp
RUN apt-get update && apt-get install -y wget unzip bash libc6-i386 lib32stdc++6 lib32gcc-s1 lib32z1 procps
RUN mkdir ja \
&& wget https://builds.openjk.org/openjk-2018-02-26-e3f22070-linux.tar.gz \
&& tar -xzf openjk-2018-02-26-e3f22070-linux.tar.gz --directory ja \
&& mv ja/install/JediAcademy/* ja/ \
&& rm -r ja/install \
&& rm openjk-2018-02-26-e3f22070-linux.tar.gz \
&& wget https://japplus.github.io/site/dl/sv_bins_linux32.zip \
&& unzip sv_bins_linux32.zip -d ja/japlus \
&& rm sv_bins_linux32.zip
WORKDIR /ja
COPY ["start_server.sh", "start_server.sh"]
RUN chmod a+x openjkded.i386 \
&& mkdir japluscfg && mkdir assets \
&& chmod a+x start_server.sh
COPY ["start_japlus_linux_autoRestart.sh", "start_japlus_linux_autoRestart.sh"]
RUN chmod a+x start_japlus_linux_autoRestart.sh

CMD ["./start_server.sh"]