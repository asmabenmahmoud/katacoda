La nécessité de collaborer entre différents développeurs sur un même projet, a
fait que des **systèmes de contrôle de version centralisés (CVCS)** ont été
développés.

Ces systèmes, tels que `CVS`, `Subversion` et `Perforce`, sont basés sur un
serveur unique contenant tous les fichiers versionnés, et des clients (_des
développeurs sur leurs propres machines_) qui extraient les fichiers de ce
serveur central. Pour de nombreuses années, cela a été le standard pour le
contrôle de version.

![Système de contrôle de version centralisé](/devopsteam/courses/git/git_formation_part1/assets/centralized-vcs.png)


## Avantages d'un tel système comparé à système de contrôle de version local:
Ce système offres des avantages indéniables, comparé aux **VCSs locaux**.

**Par exemple:**
- Toute personne travaillant sur un projet commun a une connaissance relative de
  ce que les autres font sur le projet.
- Les administrateurs peuvent mieux contrôler les accès aux différents projets.
- Et il certainement plus facile de gérer un **CVCS** que de se préoccuper de
  plusieurs bases de données locales sur chaque client.

## Inconvénients
Ce modèle présente de sérieux problèmes, les plus évidents sont:
- **Le point de défaillance unique** que représente le serveur centralisé. Si ce
  serveur tombe en panne pendant une heure, au cours de cette heure, personne ne
  peut collaborer, ni enregistrer des modifications apportées au projet.
- Si le disque dur sur lequel se trouve la base de données centrale, est corrompu
  et que des sauvegardes n'ont pas été faites, vous perdez absolument
  tout, l'historique complet du projet, à l'exception des instantanés que les
  développeurs ont sur leurs ordinateurs locaux.
