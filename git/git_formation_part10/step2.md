- Git permet une gestion `décentralisée` et autonome des développeurs sur leurs propres serveurs, 
- Un repository `central`, assure la cohérence de l'ensemble des repository locaux et leur synchronisations  
- Nous allons partage les releases via le Git Flow entres équipes, 
  
![git_collaborative](/devopsteam/courses/git/git_formation_part10/assets/n_git-collaborative2.png)

##### *Remarque:*
Cette approche décentralisée, apporte un plus par rapport au autres solutions.


#### Architecture utilisée durant la formation
Afin d'optimiser les ressources nous avons choisi d'utiliser des images docker avec un système Ubuntu. 
Nous avons créé 3 conteneurs docker. Chaque conteneur porte un rôle d'une VM Ubuntu.

- Conteneur "remote repository" : Correspond Repository Central GIT
- Conteneur "Dev1: Correspond au développeur 1 et son Repository Local GIT
- Conteneur "Dev2 : Correspond au développeur 2 et son Repository Local GIT


