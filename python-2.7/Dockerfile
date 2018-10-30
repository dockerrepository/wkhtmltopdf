FROM python:2.7.15-slim-stretch

LABEL maintainer="nielsonnas@gmail.com"

# Installing dependences
RUN apt-get update && apt-get install -y xvfb
RUN apt-get install -y openssl build-essential libssl-dev wget
RUN apt-get install -y openssl fontconfig libjpeg62-turbo libxrender1 xfonts-75dpi

WORKDIR /tmp
RUN wget -q --show-progress https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb && dpkg -i wkhtmltox_0.12.5-1.stretch_amd64.deb && apt -f install

RUN echo '#!/bin/bash' >> /usr/bin/wkhtmltopdf.sh
RUN echo 'xvfb-run -a --server-args="-screen 0, 1024x768x24" /usr/bin/wkhtmltopdf -q $*' >> /usr/bin/wkhtmltopdf.sh
RUN chmod a+x /usr/bin/wkhtmltopdf.sh

RUN mv /usr/local/bin/wkhtmltopdf /usr/bin/wkhtmltopdf
RUN ln -s /usr/bin/wkhtmltopdf.sh /usr/local/bin/wkhtmltopdf

ADD entrypoint.sh /entrypoint.sh

WORKDIR /var/task

ENTRYPOINT ["/entrypoint.sh"]
#CMD ["h"]