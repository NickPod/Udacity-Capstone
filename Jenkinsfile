pipeline{
    agent any

    stages{

        stage('LintDockerfile'){
            steps{
                sh 'hadolint Dockerfile'
            }
        }

        stage('Build Container'){
            steps{
                sh 'docker build -f Dockerfile -t udacity/udacity-capstone --label capstoneapp .'
            }
        }

        stage('Push to ECR'){
            steps{
                withAWS(credentials: 'AWS_Credentials', region: 'us-east-1'){
                    sh '''
                        aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 884552403086.dkr.ecr.us-east-1.amazonaws.com
                        docker tag udacity/udacity-capstone:latest 884552403086.dkr.ecr.us-east-1.amazonaws.com/udacity/udacity-capstone:latest
                        docker push 884552403086.dkr.ecr.us-east-1.amazonaws.com/udacity/udacity-capstone:latest
                    '''
                }
                
            }
        }

        stage('Deploy pods to EKS'){
            steps{
                withAWS(credentials: 'AWS_Credentials', region: 'us-east-1'){
                    sh '''
                        aws eks --region us-east-1 update-kubeconfig --name capstonecluster
                        kubectl config use-context arn:aws:eks:us-east-1:884552403086:cluster/capstonecluster
                        kubectl apply -f deploy.yml
                        kubectl rollout restart deployment capstone-udacity
                    '''
                }
            }
        }
    }
}