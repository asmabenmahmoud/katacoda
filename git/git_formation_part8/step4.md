
#### La première équipe, développe sur son Repository Local
 
Dans le cours précédent, nous avions effecctué la connexion du Repository Local sur le Repository Distant,
Vérifier que cela est bien le cas

 `git remote -v`{{execute T2}}
 
  
`En tant que première équipe`, vous allez effectuer vos développements. Et les commiter en local.  

 Créer un fichier script_vm2_1.sh
 
 `echo "printf 'Ceci est le script 1 \n'" > script_vm2_1.sh;cat script_vm2_1.sh`{{execute T2}}
 
 Ajouter le fichier dans la "Staging Area" (cache)
 
 `git add script_vm2_1.sh `{{execute T2}}
 
 Commmiter `valider` le nouveau fichier: dans le Repository local 
 
 `git commit -m "ajout du script_vm2_1.sh repo local VM2"`{{execute T2}}
   
 Vérifier le nouveau commmit
 
 `git log --oneline`{{execute T2}}
 
 
 Vérifier la présence d'une nouvelle branche 'master' du repo local. Elle contient le nouveau fichier.
 
 `git branch`{{execute T2}}

 "Pusher" le fichier de votre Repo local (VM2) --> vers Remote Repo Central (VM1)
 
 `git push origin master`{{execute T2}}
```
 _Répondre: yes
 - The authenticity of host 'git_remote (172.19.0.2)' can't be established.
 - ECDSA key fingerprint is SHA256:bdDVzexANY6hv6tAcvkuUUThbE9JLtgZ37ifTnGGIPQ.
 - Are you sure you want to continue connecting (yes/no)? yes
```

> A présent, en tant que `première équipe`, vous allez effectuer vos développements (script n°2), les commiter en local. 
> Mais volontairement oublier de le pusher sur le Repo Distant 

 Créer un fichier script_vm2_2.sh
 
 `echo "printf 'Ceci est le script 2 \n'" > script_vm2_2.sh; cat script_vm2_2.sh`{{execute T2}}
 
 Ajouter le fichier dans la "Staging Area" (cache)
 
 `git add script_vm2_2.sh `{{execute T2}}
 
 Commmiter `valider` le nouveau fichier: dans le Repository local 
 
 `git commit -m "ajout du script_vm2_2.sh repo local VM2"`{{execute T2}}
   
 Vérifier le nouveau commmit
 
 `git log --oneline`{{execute T2}}
 
> à ce stade, nous ne "pushons" pas le script n°2 vers le Repository Central. 
> Entre temps, l'autre équipe va effectuer des développements et les mettre à jour sur le Central / ce qui causera la situation de conflit pour nous (plus tard)
 
 #### Sur le Remote repo "Central": constater que le développement (script n°2) n'a pas encore été "pushé"   
 Constater que le script n'est pas présent
 
 `git log --oneline`{{execute T1}}

> NB: ne vous préoccupez pas du msg 'fatal' (dû au fait que le repository est encore vide)



#### La seconde équipe, développe sur son Repository Local: le script n°3  

Dans le cours précédent, nous avions effecctué la connexion du Repository Local sur le Repository Distant,
Vérifier que cela est bien le cas

 `git remote -v`{{execute T3}}
 
 
> A présent, en tant que `seconde équipe`, vous allez effectuer vos développements.
> Les commiter en local puis les pusher sur le repo distant (pour les mettres à disposition des autres équipes). 


Tout d'abord, récupèrer les dernière mise à jour du Repo Central

 Faire un `Pull` du Central
 `git pull origin master`{{execute T3}}
 ```
 _Répondre: yes
 ```
 
 Créer un fichier script_vm3_3.sh
 
 `echo "printf 'Ceci est le script 3 sur la VM3\n'" > script_vm3_3.sh;cat script_vm3_3.sh`{{execute T3}}
 
 Ajouter le fichier dans la cache "Staging Area"
 
 `git add script_vm3_3.sh `{{execute T3}}
 
 Commmiter (valider) la création du nouveau fichier: dans votre Repository local 
 
 `git commit -m "ajout du script_vm3_3.sh repo local VM3"`{{execute T3}}

 Constater que le script a bien commité dans le repo local
 
 `git log --oneline`{{execute T3}}
 
 
 "Pusher" le fichier de votre Repo local (VM3) --> vers Remote Repo Central (VM1)
 
 `git push origin master`{{execute T3}}
 
```
 _Répondre: yes
```
 
   
 
#### Remote repo "Central": constater à présent que la seconde équipe, a bien mis à jour "pushé" le script n°3

 Constater que le script a bien été pushé sur le repo distant
 
 `git log --oneline`{{execute T1}}
 
 Vous pouvez également consulter toutes les mises à jour qui ont été faites sur le Repo central, depuis le début
 
 `git log`{{execute T1}}

> LE COMMIT & PUSH sur le Central de la seconde équipe: va créer un conflit pour la première première (qui attend de pusher le script n°2)


 #### L' Equipe 1:  Va Constater un conflit et le gère 

 
** `première équipe`sur la VM2  nous avions developpé et commité le script n°2. Mais pas encore pushé au Central à ce stade

  Vérifier que le commit du script est bien  effectué sur le Repo local (même si absent du central: comme vu précédemment)
  
 `git log --oneline`{{execute T2}}
 
  "Pusher" le fichier du  Repo local (VM2) --> vers Remote Repo Central (VM1)
  
 `git push origin master`{{execute T2}}


  **Un message apparaît  "This is usually caused by another repository pushing"**
 ```
   ! [rejected]        master -> master (fetch first)
   error: failed to push some refs to 'ssh://git@git_remote/home/git/repocentral'
   hint: Updates were rejected because the remote contains work that you do
   hint: not have locally. This is usually caused by another repository pushing
```

 > Nous allons devoir gérer le conflit avant pouvoir raffraîchir `pusher` sur le Repository Central
 
 Pour cela, il faut récupèrer: la dernière version du repository Central. 
 Car il Contient les développements de la seconde équipe (script n°3), que nous n'avons pas encore en local
 
 Lancer le `Pull` du Central
 
 `git pull origin master`{{execute T2}}
 
 Si un fichier s'ouvre avec le message `merge branche master of ssh://git@git_remote/home/git/repocentral`
 > sortir du fihcier en validant  `:wq!`
 
 
 Vérifier que le "pull" vient de provoquer un Merge branch 'master' de notre branche local, avec le distant
 
  `git log --oneline`{{execute T2}}   
 
** la fusion "merge" s'est effectué avec la date cd ecommit local: c.a.d dans le même ordre que les commits en local sur chaque reposirory: script n° 1 ->2 -> 3**
 
** Si vous  souhaitez effectuer le merge dans l'ordre de mise à jour sur le Repository Central: cad script n° 1 -> 3 -> 2**
** il faut Utiliser le 'rebase'**
 
 Pour commencer, effectuez un reset hard
 
 `git reset --hard HEAD^`{{execute T2}}    
 
 Vérifier que le commit (merge) est supprimé
 
  `git log --oneline`{{execute T2}}    
 
 Lancer un `rebase` afin de fusionner dans le bon ordre: les commits Distants, avec ceux du repo local
 
  `git pull --rebase origin master`{{execute T2}} 
  
  Le Repo Local contient à présent tous les Dev. 
  Vérifier que les commits des deux équipes sont tous présent et dans le bon ordre
  
   `git log --oneline`{{execute T2}} 
  
  Lancer un Raffraichissement `push` sur le repo Distant (Central)
  
   `git push origin master`{{execute T2}}
  
  **Remote Repo Central:  vérifier le raffraîchissement 
  
  Vérifier que les commits des deux équipes on été consolidés et mergés:  dans le bon ordre
  
 `git log --oneline`{{execute T2}}
 
