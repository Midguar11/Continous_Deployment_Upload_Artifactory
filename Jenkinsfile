pipeline {
    agent any
    stages{
        stage('Git Clone'){
            steps{
                git branch: 'CI_01', url: 'https://github.com/Midguar11/Continous_Deployment_Upload_Artifactory.git'
            }
        }
        
        stage('Maven Test'){
            steps{
                sh 'mvn test'
            }
        }
        
        stage('Maven Package'){
            steps{
                sh 'mvn package'
            }
        }
        
            stage('Upload War File to Artifactory'){
            steps{
                sh 'mecho uploaded War file to Artifactory'
            }
        }
        
        stage('Maven Deploy in docker '){
            steps{
             sh '''alias docker=\'sudo docker\'
sudo rm -rf dockerimg
docker rm -f tomcatwebserver
mkdir dockerimg 
cd dockerimg
cp /var/lib/jenkins/workspace/Practice/Artifactory_Upload/target/helloworld-0.0.1.war .
touch dockerfile
cat<<EOT>>dockerfile
FROM tomcat
ADD helloworld-0.0.1.war /usr/local/tomcat/webapps
CMD ["catalina.sh","run"]
EXPOSE 8080
EOT
docker build -t tomcat:9.0 . 
docker run -itd --name tomcatwebserver -p 8888:8080 tomcat:9.0'''
            }
        }
    }
}
