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
      agent
        {
        docker
            {
            image 'nikolaidav/jenkins11prod'
            }
        }
        steps
            {
            echo 'start tomcat'
            }
      }      
    }
  }
