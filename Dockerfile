FROM openshift/jenkins-2-centos7
COPY plugins.txt /plugins.txt
COPY jenkins.yaml /usr/share/jenkins/ref/jenkins.yaml

USER 0
RUN /usr/local/bin/install-plugins.sh /plugins.txt
