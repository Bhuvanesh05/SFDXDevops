node {
   def job = build job: 'PipelineTest', parameters: [[$class: 'StringParameterValue', name: 'who', value: 'Bhuvanesh']]
       stage('write') {
              script {
                  
                   def data = "hii iam Scripted pipeline" + "And iam bhuvanesh"
                   writeFile(file: 'bhuvanesh.txt', text: data)
                   
                     }
           
       }
       stage('read') {
               script {
                   def data = readFile(file: 'bhuvanesh.txt')
                   println(data)
                   
               }
               
           
       }
       
   
}