## Steps to deploy jenkins in openshift

The deployed jenkins will have mostly used plugins and also it will have the plugins pre-installed that are defined in plugins.txt file.

* Create a new project in openshift say test-jenkins.
* oc project test-jenkins
* oc new-build https://github.com/sourabhgupta385/openshift-jenkins --to=jenkins:ext-plugins --name=jenkins-ext-plugins
* oc tag jenkins:ext-plugins jenkins:latest
* Go to Add to project -> Deploy image -> Image Stream Tag -> Namespace as test-jenkins, Image Stream as jenkins, Tag as latest -> Deploy
* Go to Applications -> Deployments -> Jenkins -> Edit Resource Limits -> specify CPU limit as 2500 millicores and memory limit as 2Gi and click Save.
* oc expose svc/jenkins --port=8080
* Now you can access jenkins with username as "admin" and password as "password".


### Note
In plugins.txt the signature to write plugin is:

pluginID:version

If no version is given then the latest version of the plugin will be installed.
