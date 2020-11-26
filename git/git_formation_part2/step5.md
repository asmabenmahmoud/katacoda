Git gère **trois états** dans lesquels les fichiers peuvent être à un instant T:
- **Validé**: signifie que les données sont stockées en sécurité dans votre base
  de données locale.

- **Modifié**: signifie que vous avez modifié le fichier mais qu'il n'a pas
  encore été validé en base.

- **Indexé**: signifie que vous avez marqué un fichier modifié dans sa version
  actuelle pour qu'il fasse partie du prochain instantané du projet.


Ceci nous mène aux trois sections principales d'un projet Git:
- le répertoire Git (**git directory** ou **remote**): C'est l'endroit où Git
  stocke les méta-données et la base de données des objets de votre projet.
  C'est la partie la plus importante de Git, et c'est ce qui est copié lorsque
  vous clonez un dépôt depuis un autre ordinateur.

- le répertoire de travail (**working directory**): C'est une extraction unique
  d'une version du projet. Ces fichiers sont extraits depuis la base de données
  compressée dans le répertoire Git et placés sur le disque pour pouvoir être
  utilisés ou modifiés.

- la zone d’index (**staging area**): C'est un simple fichier, généralement situé
  dans le répertoire Git, qui stocke les informations concernant ce qui fera
  partie du prochain instantané.

![File states](/devopsteam/courses/git/git_formation_part2/assets/areas.png)


Un **workflow de base** sur Git, ressemble à ceci:

1 - vous modifiez des fichiers dans votre répertoire de travail (**working directory**).

2 - vous indexez les fichiers modifiés, ce qui ajoute des instantanés de ces
    fichiers dans la zone d'index (**staging area**).

3 - vous validez (avec un `commit` par exemple), ce qui a pour effet de basculer
    les instantanés des fichiers de l'index dans la base de données du répertoire
    Git (**git directory** ou **remote**).
