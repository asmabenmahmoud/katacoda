La principale différence entre **Git** et tout autre **VCS** est la façon
dont **Git** considère ses données.

## La vision des autres VCS
Conceptuellement, la plupart des autres systèmes stockent des informations sous
forme de liste de modifications basées sur des fichier. Ces systèmes (`CVS`,
`Subversion`, `Perforce`, `Bazaar`, etc.) considèrent l'information qu'ils gèrent
comme une liste de fichiers et les modifications effectuées sur chaque fichier
dans le temps.

![Deltas](/devopsteam/courses/git/git_formation_part2/assets/deltas.png)

## La vision de Git
**Git** a une toute autre philosophie. Au lieu de cela, les données sur **Git**
ressemblent davantage à **un instantanés** d'un système de
fichiers miniature.

Chaque fois que vous validez ou enregistrez l'état de votre projet dans **Git**,
il prend un **instantané** de tous vos fichiers à ce moment-là et stocke une
référence à cet instantané. Pour gagner en efficacité, si les fichiers n'ont pas
changé, **Git** ne stocke pas le fichier à nouveau, juste une référence vers le
fichier original qu'il a déjà enregistré. **Git** pense ses données plus à la
manière d'un **flux d'instantanés**.

![Snapshots](/devopsteam/courses/git/git_formation_part2/assets/snapshots.png)


> C'est une distinction importante entre **Git** et presque tous les autres **VCS**.
> Cela fait de **Git** plus un mini système de fichiers avec des outils
> incroyablement puissants construits par dessus, plutôt qu'un simple **VCS**.
