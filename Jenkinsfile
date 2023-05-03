pipeline {
  agent any
    stages {
        stage('Getting project from Git') {
             steps{
                script{
                    checkout([$class: 'GitSCM', branches: [[name: '*/main']],
                        userRemoteConfigs: [[
                            url: 'https://github.com/med-aziz-ben-haha/unified-dashboard-front-pfe-ooredoo.git']]])
                }
            }
        }
        stage('Cleaning the project') {
             steps{
                script{
                    sh "npm ci"
                }
            }
        }
        stage('Artifact Construction') {
             steps{
                script{
                    sh "ng build"
                }
            }
        }


        stage('Build Docker Image') {
             steps{
                script{
                    sh "docker build -t azizbenhaha/unified-dashboard-front-pfe-ooredoo:latest ."
                }
            }
        }
 stage('login dockerhub') {
                                        steps {
				sh 'docker login -u azizbenhaha --password dckr_pat_-SnwrdC_ELsL6it2JT6cgIcAlrs'
                                            }
		  }

	                      stage('Push Docker Image') {
                                        steps {
                                   sh 'docker push azizbenhaha/unified-dashboard-front-pfe-ooredoo:latest'
                                            }
		  }

       }
      }
