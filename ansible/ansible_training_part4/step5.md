


> **Modifier** le playbook **"playbook_ex01.yml"** de **l'exercice précédent** de sorte qu'il se connecte sur la machine cible avec l'utilisateur **"toto"**.  Utiliser l'élévation de privilèges si besoin 

> Cette utilisateur est déja créé et configuré sur la machine cible. Le mot de passe est le même que le nom d'utilisateur

> modifier manuellement sur le serveur Ansible le contenu du fichier /work_dir/training-files/config.txt: remplacer DocumentRoot "/www/example1" par DocumentRoot "/www/example". 

> Le but de cette modification c'est de déclencher la 2ème tâche du Playbook qui permet de copier le fichier (si le fichier n'a pas été modifié, le module copy ne va pas recopier le fichier) 

> Lancer le playbook avec l'utilisateur root
