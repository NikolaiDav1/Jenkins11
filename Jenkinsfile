pipeline
  {
  agent
    {
    docker
        {
        image 'nikolaidav/jenkins11build:v5'
        args '--privileged -v /var/run/docker.sock:/var/run/docker.sock -u root'
        }
    }

  stages
    {
    stage('Copy source with configs')
      {
      steps
        {
        git(url: 'https://github.com/NikolaiDav1/Jenkins11.git')
        }
      }

    stage('Build jar')
      {
      steps
        {
        sh 'mvn package'
        }
      }

    stage('Make docker image')
      {
      steps
        {
        sh 'docker build -t nikolaidav/jenkins11prod -f ./docker-prod/Dockerfile target/'
        sh 'docker push nikolaidav/jenkins11prod'
        }
      }

    stage('Start prod docker image')
      {
      steps
        {
        sh 'mkdir ~/.ssh'
        sh 'ssh-keyscan -H 51.250.99.110 >> ~/.ssh/known_hosts'
        sh '''ssh -tt root@51.250.99.110 << EOF
  sudo docker run -p 8080:8080 nikolaidav/jenkins11prod
EOF'''  
        }
      }      
    }
  }
