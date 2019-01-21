oc new-project test-jenkins

oc new-build https://github.com/sourabhgupta385/openshift-jenkins --to=jenkins:ext-plugins --name=jenkins-ext-plugins

oc policy add-role-to-user edit system:serviceaccount:test-jenkins:default

sleep 30

oc tag jenkins:ext-plugins jenkins:latest

oc new-app test-jenkins/jenkins:latest --env CASC_JENKINS_CONFIG=/usr/share/jenkins/ref/jenkins.yaml

oc expose svc/jenkins --port=8080
