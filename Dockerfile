FROM openshift/jenkins-2-centos7

USER root

# RUN yum update -y
RUN yum install -y sudo
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "default ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo "default:!!:17936::::::" >> /etc/shadow
RUN yum install -y docker-client
RUN yum install -y ansible
RUN [ -d /home/jenkins ] || mkdir /home/jenkins
RUN echo "docker='sudo docker'" > /home/jenkins/.bashrc

USER jenkins

