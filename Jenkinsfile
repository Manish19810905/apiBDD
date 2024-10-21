#!groovy

pipeline {
	parameters{
		choice( choices: '-- select Environment --\nRelease\nStage', description: 'select Environment', name: 'Environment')
    }
    agent {label 'Windows'}
    
    tools {
        jdk 'JAVA_8'
        maven 'Maven 3.3.9'
    }

    stages {

	stage('Mvn build'){
			steps{
				script{		
						if(environment.equals('Release')){
						checkout([$class: 'GitSCM',
                   branches: [[name: 'Release']],
                    doGenerateSubmoduleConfigurations: false,
                   userRemoteConfigs: [[credentialsId: 'FXS_app3535035_SRC',
                    url: 'git@gitlab.prod.fedex.com:APP3535035/dot5800_selenium_project.git' 
				]]])
						withCredentials([usernamePassword(credentialsId: '3535035-DOT5800', usernameVariable: 'usr', passwordVariable: 'pswd')]) {
							bat'''
								Dir
								mvn test -s settings.xml -Dusername=%usr% -Dpassword=%pswd% -Dsurefire.suiteXmlFiles=testng.xml
							'''
							 publishHTML([allowMissing: true, alwaysLinkToLastBuild: true, keepAll: true, reportDir: 'target/surefire-reports/', reportFiles: 'Extent.html', reportName: 'DOT5800 Suite Report', reportTitles: ''])
						}
						}
						
					
					
				
        
		
				else if(environment.equals('Stage')){
						checkout([$class: 'GitSCM',
                   branches: [[name: 'Stage']],
                    doGenerateSubmoduleConfigurations: false,
                   userRemoteConfigs: [[credentialsId: 'FXS_app3535035_SRC',
                    url: 'git@gitlab.prod.fedex.com:APP3535035/dot5800_selenium_project.git' 
				]]])
						withCredentials([usernamePassword(credentialsId: '3535035-DOT5800', usernameVariable: 'usr', passwordVariable: 'pswd')]) {
							bat'''
								Dir
								mvn test -s settings.xml -Dusername=%usr% -Dpassword=%pswd% -Dsurefire.suiteXmlFiles=testng.xml
							'''
							 publishHTML([allowMissing: true, alwaysLinkToLastBuild: true, keepAll: true, reportDir: 'target/surefire-reports/', reportFiles: 'Extent.html', reportName: 'DOT5800 Suite Report', reportTitles: ''])
						}
						}
						
					}
					}
				}
			
		
		stage('Extent Report'){				
			steps{
				script{
						publishHTML([allowMissing: true, alwaysLinkToLastBuild: true, keepAll: true, reportDir: 'target/surefire-reports/', reportFiles: 'Extent.html', reportName: 'Extent Report', reportTitles: ''])
				}
			}    
		}
    }	
}
