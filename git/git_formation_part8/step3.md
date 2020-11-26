
Nous allons ouvrir 3 terminaux. Chaque terminal correspond à une VM ubuntu (Conteneur docker).

Vérifier que l'environnement de formation est prêt:

`if [ $(docker ps  | grep -v CONTAINER | wc -l) -ge 3 ]; then echo "OK"; else export demarre=$(docker ps  | grep -v CONTAINER | wc -l);while [ $demarre != 3 ]; do export demarre=$(docker ps  | grep -v CONTAINER | wc -l); echo "Patientez chargement Docker:  NB containers actuel = "$demarre; sleep 30; done;  fi`{{execute T1}}

Puis, lancer les commandes suivantes:

`g() { docker exec -it git_remote bash -c "cd /work_dir; echo 'PS1='\''git_remote# '\' >> /root/.bashrc; su - git"; } && g`{{execute T1}}

`d1() { docker exec -it dev1_local bash -c "cd /work_dir; echo 'PS1='\''dev1_gitlocal# '\' >> /root/.bashrc; su - git"; } && d1`{{execute T2}}

`d2() { docker exec -it dev2_local bash -c "cd /work_dir; echo 'PS1='\''dev2_gitlocal# '\' >> /root/.bashrc; su - git"; } && d2`{{execute T3}}

##### _Remarque_:
Le prompt git_remote#, dev1_gitlocal# et dev2_gitlocal# vous aidera à repèrer la machine sur laquelle vous êtes connecté.

Si toutes fois vous êtes sortie avec un exit , vous pouvez taper les commandes suivantes:

- g  => Pour se connecter à la VM 'git_remote'.
- d1 => Pour se connecter à la VM 'dev1_gitlocal'.
- d2 => Pour se connecter à la VM 'dev2_gitlocal'.
