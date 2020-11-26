La commande `git init` vous permet d'initialiser localement un nouveau dépôt,
ou en réinitialiser un existant, qu'il soit vide ou pas.

Vous l'invoquez sans paramètres, en vous mettant au préalable dans le répertoire
cible, soit vous précisez le répertoire cible en argument **i.e.** `git init <directory>`.

_directory_ Représente le chemin d'accès au répertoire cible.

> Si vous utilisez `git init` sans argument, le suivi de version sera appliqué
> au répertoire courant.

**Exemple:** Pour activer le suivi de version pour le projet `toto`, ayant pour
chemin d'accès `/opt/local/projets/toto`, vous avez deux options:

- Soit, en invoquant `git init /opt/local/projets/toto`.
- Soit, vous vous mettez dans le répertoire cible avec la commande
  `cd /opt/local/projets/toto`, ensuite vous lancez `git init`.


L'invocation de `git init`, créera un sous répertoire appelé `.git` dans le
répertoire cible, contenant toutes les méta-données permettant à git de suivre
votre projet.

**Exercice:**

_Éléments d'entrée:_

 - Un répertoire `~/mon-projet` est déjà créé dans votre répertoire de travail
   personnel.
 - L'éditeur de texte à utiliser est `vim`.

_Objectif(s):_

 1 - Initialiser un dépôt git dans le répertoire `mon-projet`.

 2 - Observer le contenu du répertoire `.git` créé dans ce nouveau dépôt.
