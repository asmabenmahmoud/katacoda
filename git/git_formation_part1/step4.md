C'est là que **les systèmes de contrôle de version distribués (DVCS)**
interviennent.

Dans un **DVCS** (tel que `Git`, `Mercurial`, `Bazaar` ou `Darcs`), les clients
ne se contentent pas de récupérer le dernier instantané des fichiers:

Ils sont le miroir du dépôt distant. Ainsi, si un serveur est hors d'usage et
que les développeurs collaborent via celui-ci, n'importe quel dépôt client peut
être copié sur un nouveau serveur pour le restaurer.

![Système de contrôle de version distribué](/devopsteam/courses/git/git_formation_part1/assets/distributed-vcs.png)

Chaque copie du dépôt distant sur un client peut être vue comme une sauvegarde
complète de toutes les données.
