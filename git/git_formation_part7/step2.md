- Git permet une gestion décentralisée et autonome des développements
- La centralisation du versioning permet ensuite de faire bénéficier des développements ou nouvelles versions: aux autres équipes,
- Un Repository Central, assure la cohérence de l'ensemble des Repository Locaux et leurs synchronisations  

![git-collaborative](/testgitessai/scenarios/git_training_part3/assets/git-collaborative.png)

##### *Remarque:*
Cette approche décentralisée, apporte un plus par rapport au autres solutions.
En effet, les programmeurs peuvent continuer à travailler localement en toute autonomie, puis mettre à jour le site central au timing souhaité.
Les versions des deux équipe sont ainsi fusionnées.

#### Architecture utilisée durant la formation

![git-remote](/testgitessai/scenarios/git_training_part3/assets/git-remote.png)

Afin d'optimiser les ressources nous avons choisi d'utiliser des images docker avec un système Ubuntu. 
Nous avons créé 3 conteneurs docker. Chaque conteneur porte un rôle d'une VM Ubuntu.

- Conteneur "remote repository" : Correspond Repository Central GIT
- Conteneur "Dev1: Correspond au développeur 1 et son Repository Local GIT
- Conteneur "Dev2 : Correspond au développeur 2 et son Repository Local GIT


