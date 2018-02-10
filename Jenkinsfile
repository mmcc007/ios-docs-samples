node ('osx') {
    env.PATH = "/usr/local/bin:${env.PATH}"
    env.FASTLANE_DONT_STORE_PASSWORD=1
    // set locale for screenshots
    env.LC_CTYPE = "en_US.UTF-8"
    env.LC_ALL = "en_US.UTF-8"
    env.FASTLANE_EXPLICIT_OPEN_SIMULATOR=1
    ansiColor('xterm') {
        withCredentials([string(credentialsId: 'FASTLANE_USER', variable: 'FASTLANE_USER'),
                     string(credentialsId: 'FASTLANE_PASSWORD', variable: 'FASTLANE_PASSWORD'),
                     string(credentialsId: 'MATCH_PASSWORD', variable: 'MATCH_PASSWORD'),
                     string(credentialsId: 'TIMECAR_PASSWORD', variable: 'TIMECAR_PASSWORD')
                ]) {
            stage('Preparation') { // for display purposes
                // Get some code from a GitHub repository
                git credentialsId: '406214e1-4f8f-4ca1-8a6d-d3ac8b1d8787', url: 'http://mmccabe@dev.timecar.co:9090/timecar/ios-doc-samples.git'
                sh "env"
                //sh "ssh-agent bash -c 'ssh-add /Users/jenkins/.ssh/id_rsa'"
                sh "cd ./diagflow/stopwatch; fastlane certificates"
                sh "security -v unlock-keychain -p '$TIMECAR_PASSWORD' '/Users/jenkins/Library/Keychains/login.keychain-db'"
            }
            // stage('Test') {
            //     sh "fastlane test"
            // }
            // stage('Screenshot') {
            //     sh "fastlane screenshot"
            // }
            stage('beta') {
                // sh "security -v unlock-keychain -p '$TIMECAR_PASSWORD' '/Users/jenkins/Library/Keychains/login.keychain-db'"
                sh "cd diagflow/stopwatch; fastlane beta"
                archive 'TimeCar Poker.ipa'
            }
        }
    }
}

