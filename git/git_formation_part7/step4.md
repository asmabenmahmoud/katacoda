
 
#### Installer un `Remote Repository Central` GIT  
(manips à faire, pour info: car en réalité vous aurez toujours un GIT central disponible)

Créer  le Repository Central
  `mkdir repocentral; cd repocentral`{{execute T1}}
 
 Initialiser le Repository Central
  `git init --bare`{{execute T1}}


#### Première équipe: créée un Repository Local, afin de versionner ses développements 
   
 Lancer l'installation du premier Repository 'local':
 `git init `{{execute T2}}
 
 Configurer le Git local (mail et username)
 `git config --global user.email "git@example.com";git config --global user.name "git Name";pwd;git config --list`{{execute T2}}   
 
 Connecter ce Repository local avec le Remote Repository Central  (branche 'origin')
 `git remote add origin ssh://git@git_remote/home/git/repocentral`{{execute T2}}

 Vérifier la connexion:
 `git remote -v`{{execute T2}}
 
**`première équipe` développe sur la VM, puis versionne**
 
 A présent, vous pouvez  effectuer des développements.
 Les commiter en local puis les pusher sur le Repo distant: lorsque vous souhaiterez en faire bénéficier les autres équipes.  

 Créer un fichier script_test_vm2.sh
 `echo "printf 'Ceci est un script test\n'" > script_test_vm2.sh;cat script_test_vm2.sh`{{execute T2}}
 
 Ajouter le fichier dans la cache "Staging Area"
 `git add script_test_vm2.sh `{{execute T2}}
 
 Commmiter (valider) la création du nouveau fichier: dans votre Repository local 
 
 `git commit -m "ajout du script_test_vm2.sh repo local VM2"`{{execute T2}}
 
 Vérifier que le commit est bien passé.
 `git log --oneline`{{execute T2}}
   
 Vérifier la présence d'une nouvelle branche 'master' du repo local. Elle contient le nouveau fichier.
 `git branch`{{execute T2}}
 
 "Pusher" le fichier de votre Repo local (VM2) --> vers Remote Repo Central (VM1)
 `git push origin master`{{execute T2}}
 
    ##### _Répondre:
           > Are you sure you want to continue connecting (yes/no)? 
                                                       -->  'yes'
 
           > git@git_remote's password: 
                                   -->   'git'
 
 
 
 
#### Sur le Remote Repo "Central", constater que le développement a bien été "pushé" 
 Constater que le script et sont commit a bien été pushé sur le repo distant
 `git log --oneline`{{execute T1}}




#### Seconde équipe: créée un second Repository 'local' afin de versionner ses développements 

 Lancer l'installation du second Repository 'local':
 `git init `{{execute T3}}
 
 Configurer le Git local (mail et username)
 `git config --global user.email "git@example.com";git config --global user.name "git Name";pwd;git config --list`{{execute T3}}   
 
 Connecter ce Repository local avec le Remote Repository (Central):
 `git remote add origin ssh://git@git_remote/home/git/repocentral`{{execute T3}}

 Vérifier la connexion:
 `git remote -v`{{execute T3}}
 
 Pour commencer, récupèrer  les développements mis à disposition par les autres équipes sur le Repo distant
  `git pull origin master`{{execute T3}}
 
**`seconde équipe` développe sur la VM, puis versionne**

 A présent, en tant que seconde équipe, vous pouvez également effectuer des développements.
 Les commiter en local puis les pusher sur le repo distant (lorsque vous souhaiterez en faire bénéficier les autres équipes).  
 
 -Créer un fichier script_test_vm3.sh
 `echo "printf 'Ceci est un script test sur la VM3\n'" > script_test_vm3.sh;cat script_test_vm3.sh`{{execute T3}}
 
 Ajouter le fichier dans la cache "Staging Area"
 `git add script_test_vm3.sh `{{execute T3}}
 
 Commmiter (valider) la création du nouveau fichier: dans votre Repository local 
 `git commit -m "ajout du script_test_vm3.sh repo local VM3"`{{execute T3}}
   
 Vérifier que le commit est bien passé.
 `git log --oneline`{{execute T3}}
 
 Vérifier la présence du branche 'master' pour tracker ce fichier nouveau fichier ajouté:
 `git branch`{{execute T3}}
 
 "Pusher" le fichier de votre Repo local (VM3) --> vers Remote Repo Central (VM1)
 `git push origin master`{{execute T3}}
 
    ##### _Répondre:
           > Are you sure you want to continue connecting (yes/no)? 
                                                       -->  'yes'
 
           > git@git_remote's password: 
                                   -->   'git'
 
 
 
 
 
#### Sur le Remote Repo "Central": constater que la seconde équipe de dev, a également bien "pushé" son code
 Constater que le script et sont commit ont bien été pushé sur le repo distant
 `git log --oneline`{{execute T1}}
 
 Vous pouvez également consulter toutes les mises à jour qui ont été faites sur le Repo central depuis le début
 `git log`{{execute T1}}

