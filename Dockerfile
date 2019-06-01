FROM openshift/jenkins-2-centos7

USER root

# RUN yum update -y
RUN yum install -y sudo
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "default ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "default:!!:17936::::::" >> /etc/shadow
RUN yum install -y epel-release
RUN yum install -y docker-client
RUN yum install -y ansible
RUN yum install -y python-pip
RUN pip install -U pip
RUN pip install pyopenssl
RUN pip install "ansible[azure]"
RUN pip install apache-libcloud
RUN pip uninstall -y cryptography
RUN pip install cryptography
RUN [ -d /home/jenkins ] || mkdir /home/jenkins
RUN echo "docker='sudo docker'" > /home/jenkins/.bashrc

# jenkins_keystore.jks -storepass mypassword

USER jenkins

ENV JENKINS_OPTS --httpPort=8080 --httpsPort=8443 --httpsKeyStore=/var/lib/jenkins/jenkins_keystore.jks --httpsKeyStorePassword=mypassword

EXPOSE 8443
EXPOSE 25
