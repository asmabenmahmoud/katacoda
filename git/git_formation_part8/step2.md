- Git permet une gestion `décentralisée` et autonome des développeurs sur leurs serveurs. La centralisation du versioning permet ensuite de diffuser les développements aux autres équipes,
- Un repository `central`, assure la cohérence de l'ensemble des repository locaux et leur synchronisations  
- Néanmoins certains cas de conflits peuvent se poser si le repository central a évoluer, alors que l'on essaie d'y répercuter nos développements, 
  * c'est ce que nous allons voir par la suite

![git_users_archi](/testgitessai/scenarios/git_training_part1/assets/git_users_archi.png)


##### *Remarque:*
Cette approche décentralisée, apporte un plus par rapport au autres solutions.


#### Architecture utilisée durant la formation
Afin d'optimiser les ressources nous avons choisi d'utiliser des images docker avec un système Ubuntu. 
Nous avons créé 3 conteneurs docker. Chaque conteneur porte un rôle d'une VM Ubuntu.

- Conteneur "remote repository" : Correspond Repository Central GIT
- Conteneur "Dev1: Correspond au développeur 1 et son Repository Local GIT
- Conteneur "Dev2 : Correspond au développeur 2 et son Repository Local GIT


