- Git permet une gestion décentralisée des développements (sur diffrentes VMs),
- La centralisation du versioning, contribue quand à elle, au partage des développements entres équipes,
- Un Repository Central, assure le rôle de synchronisation entres les différents Repository

![git_users_archi](/testgitessai/scenarios/git_training_part1/assets/git_users_archi.png)

##### *Remarque:*
Cette approche décentralisée, apporte un plus par rapport au autres solutions.
En effet, les programmeurs peuvent continuer à travailler localement en toute autonomie, puis mettre à jour le Repository distant au timing souhaité. Cela permet de diffuser leurs programmes aux autres équipes.

Afin d'optimiser les ressources nous avons choisi d'utiliser des images docker avec un système Ubuntu. 
Nous avons créé un conteneurs docker. Il permet de se familiariser aux commandes de bases

- Conteneur "Dev1: Correspond à l'équipe de développement et son repository local GIT
