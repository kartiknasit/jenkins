FROM jenkins/jenkins

USER root

RUN apt-get update -y

RUN apt-get install -y python3 curl python3-distutils python3-apt

RUN curl 'https://bootstrap.pypa.io/get-pip.py' > get-pip.py && \
    python3 get-pip.py && \
    pip install ansible --upgrade

RUN apt-get update -y

USER jenkins
