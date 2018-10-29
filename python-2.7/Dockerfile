FROM python:2.7.15

LABEL maintainer="nielsonnas@gmail.com"

# Installing dependences
RUN apt-get update && apt-get install -y wkhtmltopdf xvfb
RUN apt-get install -y openssl build-essential libssl-dev

RUN echo '#!/bin/bash' >> /usr/bin/wkhtmltopdf.sh
RUN echo 'xvfb-run -a --server-args="-screen 0, 1024x768x24" /usr/bin/wkhtmltopdf -q $*' >> /usr/bin/wkhtmltopdf.sh
RUN chmod a+x /usr/bin/wkhtmltopdf.sh

RUN ln -s /usr/bin/wkhtmltopdf.sh /usr/local/bin/wkhtmltopdf

ADD ./bashrc.sh /root/.bashrc
RUN sed -i 's/\r//' /root/.bashrc

WORKDIR /var/task

ENTRYPOINT ["wkhtmltopdf"]
CMD ["h"]