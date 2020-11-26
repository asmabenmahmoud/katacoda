 
#### Cloner un Repository distant existant
 
 
  Créer un répertoire d'accueil: pour le clone du repository distant 
  
 `mkdir /home/git/repoclone; cd /home/git/repoclone;pwd`{{execute T1}}
 
  Initialiser le nouvel enviroment git
  
 `git init `{{execute T1}}
 
 Lancer la commande de clone
 
 `git clone https://github.com/testgitpub/remoterepo.git`{{execute T1}}

 Constater que le repository  "remoterepo" (et son arborescence) ont été importés sur la VM 
 
 `ls; ls -l remoterepo/*`{{execute T1}}
 
 Vous pouvez même travailler sur ce nouveau repository local (initialiser à partir d'un clone)
 
 Créer le fichier test.log
 
 `cd /home/git/repoclone/remoterepo/;touch test.log;ls`{{execute T1}}
 
Ajouter ce ficjhier dans la stagin area (index)

`git add --all`{{execute T1}}

Consulter le status

`git status`{{execute T1}}

Commiter par exemple, un nouveau fichier dans votre repository local 

`git commit -a -m "ajout fic test.log dans repoclone"`{{execute T1}}
 
Vérifier que le commit est pris en compte dans le repo local

`git log --oneline`{{execute T1}}
