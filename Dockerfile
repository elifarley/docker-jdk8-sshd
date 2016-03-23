FROM frolvlad/alpine-oraclejdk8:cleaned
MAINTAINER Elifarley <elifarley@gmail.com>

RUN apk --update add --no-cache bash openssh rsync && \
    rm -rf /var/cache/apk/*

RUN echo -e "\nPort 22\nPermitRootLogin yes\nPasswordAuthentication no\nChallengeResponseAuthentication no\n" >> /etc/ssh/sshd_config && \
  cp -a /etc/ssh /etc/ssh.cache

ENV _USER root

ENV HOME /$_USER
RUN mkdir -p $HOME/.ssh && chmod go-w $HOME && chmod 700 $HOME/.ssh && chown $_USER:$_USER -R $HOME

WORKDIR $HOME

EXPOSE 22

COPY entry.sh /entry.sh

ENTRYPOINT ["/entry.sh"]

CMD ["/usr/sbin/sshd", "-D", "-f", "/etc/ssh/sshd_config"]
