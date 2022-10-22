FROM centos

RUN cd /etc/yum.repos.d/

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*

RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum -y install openssh-server

RUN yum -y install passwd

RUN useradd remote_user && \
    echo "1234" | passwd remote_user --stdin && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh

COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user -R /home/remote_user/.ssh && \
    chmod 600 /home/remote_user/.ssh/authorized_keys

RUN ssh-keygen -A

RUN yum -y install mysql

RUN yum -y install python39

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python3 get-pip.py && \
    pip install awscli --upgrade

CMD /usr/sbin/sshd -D
