pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('2e44c651-3b3e-4eef-bc1a-051e4c9ebd5f')
	}

	stages {

		stage('Build') {

			steps {
				sh 'docker build -t animeshdeka/firefox:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push animeshdeka/firefox:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
