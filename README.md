# Purpose

* The deployed jenkins will have mostly used plugins and also it will have the plugins pre-installed that are defined in plugins.txt file.
* All the configuration for jenkins defined in the jenkins.yaml file will be automatically done at the time of deployment.

## Steps to deploy jenkins in openshift

* Create a new project in openshift say test-jenkins.
* oc project test-jenkins
* Import https://github.com/sourabhgupta385/openshift-sonarqube/blob/master/sonarqube-ephemeral-template.yaml this yaml to make sonarqube server up
* Note the sonarqube URL something like: http://sonar-ms-qa-sourabh.apps.na39.openshift.opentlc.com
* Login in sonarqube server with username as admin and password as admin
* Generate the token somenthing like cdf76c46cc4be9dc7b60b538266c5fd95b67e7dd and note it
* In the jenkins.yaml file, at line 7 give the token that was obtained in previous step and at line 8 give the serverUrl as noted in previous steps
* oc new-build https://github.com/sourabhgupta385/openshift-jenkins --to=jenkins:ext-plugins --name=jenkins-ext-plugins
* oc tag jenkins:ext-plugins jenkins:latest
* Go to Add to project -> Deploy image -> Image Stream Tag -> Namespace as test-jenkins, Image Stream as jenkins, Tag as latest -> Add the environment variable as CASC_JENKINS_CONFIG and its value as /usr/share/jenkins/ref/jenkins.yaml
* Go to Applications -> Deployments -> Jenkins -> Edit Resource Limits -> specify CPU limit as 2500 millicores and memory limit as 2Gi and click Save.
* oc expose svc/jenkins --port=8080
* Now you can access jenkins with username as "admin" and password as "password".


### Note
In plugins.txt the signature to write plugin is:

pluginID:version

If no version is given then the latest version of the plugin will be installed.
