# jenkins-docker


```sh
docker run -itd -e JENKINS_USER=$(id -u) \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $(pwd)/jenkins_home:/var/jenkins_home \
-v $(which docker):/usr/bin/docker \
-p 9200:8080 -p 50000:50000  \
-u root \
nguyencuong382/jenkins-docker
```
