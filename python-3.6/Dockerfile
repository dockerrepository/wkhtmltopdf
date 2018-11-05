FROM python:3.6.7-slim-stretch

LABEL maintainer="nielsonnas@gmail.com"

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt update && apt-get install -y locales procps
RUN touch /etc/locale.gen && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && locale-gen

# Installing dependences
RUN apt install -y xvfb
RUN apt install -y openssl build-essential libssl-dev wget git
RUN apt install -y fontconfig libjpeg62-turbo libxrender1 xfonts-75dpi

WORKDIR /tmp
RUN wget -q --show-progress https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb && dpkg -i wkhtmltox_0.12.5-1.stretch_amd64.deb && apt -f install

RUN echo -e '#!/bin/bash \n\nxvfb-run -a --server-args="-screen 0, 1024x768x24" /usr/bin/wkhtmltopdf -q $*' >> /usr/bin/wkhtmltopdf.sh
RUN chmod a+x /usr/bin/wkhtmltopdf.sh

RUN mv /usr/local/bin/wkhtmltopdf /usr/bin/wkhtmltopdf && ln -s /usr/bin/wkhtmltopdf.sh /usr/local/bin/wkhtmltopdf

ADD entrypoint.sh /entrypoint.sh

WORKDIR /var/task

ENTRYPOINT ["/entrypoint.sh"]
#CMD ["h"]