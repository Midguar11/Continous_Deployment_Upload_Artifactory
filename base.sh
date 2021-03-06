alias docker='sudo docker'
sudo rm -rf dockerimg
docker rm -f tomcatwebserver
mkdir dockerimg 
cd dockerimg
cp /var/lib/jenkins/workspace/Practice/Continous_Deployment/target/helloworld-0.0.1.war .
touch dockerfile
cat<<EOT>>dockerfile
FROM tomcat
ADD helloworld-0.0.1.war /usr/local/tomcat/webapps
CMD ["catalina.sh","run"]
EXPOSE 8080
EOT
docker build -t tomcat:9.0 . 
docker run -itd --name tomcatwebserver -p 8888:8080 tomcat:9.0