pipeline
  {
  agent
    {
    docker
        {
        image 'nikolaidav/jenkins11build:v2'
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
        sh 'docker build -t nikolaidav/jenkins11prod .'
        sh 'docker push nikolaidav/jenkins11prod'
        }
      }   
    }
  }
