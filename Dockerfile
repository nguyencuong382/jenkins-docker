FROM jenkins/jenkins
USER root

RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list && \
    apt-get update && \
    apt-get install -y kubeadm=1.24.0-00 && \
    apt-get install -y tree nano curl sudo

RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    bash ./get_helm.sh

RUN curl https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz | tar xvz -C /tmp/ && \
    mv /tmp/docker/docker /usr/bin/docker && \
    curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod 755 /usr/local/bin/docker-compose

RUN usermod -a -G sudo jenkins
RUN echo "jenkins ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
USER jenkins

ADD ./gdrive_2.1.1_linux_386.tar.gz /usr/local/bin
RUN sudo chmod +x /usr/local/bin/gdrive