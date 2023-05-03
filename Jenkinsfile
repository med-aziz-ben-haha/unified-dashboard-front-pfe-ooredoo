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

                stage('Code Quality Check via SonarQube') {
                    steps{

                     		sh "  sonar-scanner -Dsonar.projectKey=unified-dashboard-front-pfe-ooredoo -Dsonar.sources=. -Dsonar.host.url=http://192.168.1.71:9000 -Dsonar.login=387d14a90f6d00402a3627d0af82239e49f14b76"

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
