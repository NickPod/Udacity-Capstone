pipeline{
    agent any

    stages{

        stage('LintDockerfile'){
            steps{
                hadolint Dockerfile
            }
        }

        stage('Build Container'){
            steps{
                docker build -f Dockerfile . -t udacity/udacity-capstone --label capstoneapp
            }
        }

        stage('Push to ECR'){
            steps{
                aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 884552403086.dkr.ecr.us-east-1.amazonaws.com
                docker tag udacity/udacity-capstone:latest 884552403086.dkr.ecr.us-east-1.amazonaws.com/udacity/udacity-capstone:latest
                docker push 884552403086.dkr.ecr.us-east-1.amazonaws.com/udacity/udacity-capstone:latest
            }
        }
    }
}