#!/usr/bin/env groovy
pipeline {
    agent any
    // environment {
    //     AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
    //     AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    //     AWS_DEFAULT_REGION = "us-east-1"
    // }     {
    stages {
        stage("Create an EKS Cluster") {
            withAWS(profile:'ms', region:'us-west-1') {
                steps {
                    script {
                        dir('terraform') {
                            sh "terraform init"
                            sh "terraform apply -auto-approve"
                        }
                    }
                }
            }                    
        }
        stage("Deploy to EKS") {
            withAWS(profile:'ms', region:'us-west-1') {
                steps {
                    script {
                        dir('kubernetes') {
                            sh "aws eks update-kubeconfig --name brian-eks-cluster"
                            sh "kubectl apply -f nginx-deployment.yaml"
                            sh "kubectl apply -f nginx-service.yaml"
                        }
                    }
                }
            }
        }
    }
}