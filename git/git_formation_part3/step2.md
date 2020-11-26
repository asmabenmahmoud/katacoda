Il est très important de comprendre la notion du **contexte** ou **scope** de
configuration.

## Options de scope ou contexte de configuration
La commande `git config` accepte des arguments permettant de spécifier le contexte
de configuration sur lequel on souhaite opérer: `--local`, `--global` et `--system`.

- `--local`: Git lit et écrit dans le fichier de configuration **local au dépôt
  courant**. Il s'agit du fichier `.git/config` qui se trouve à la racine d'un
  dépôt git' (Ceci est le comportement par défaut de **git**).

- `--global`: Git lit et écrit dans le fichier de configuration `~/.gitconfig`
  (ou `~/.config/git/config`) **propre à chaque utilisateur** au sein d'un même
  système d'exploitation.

- `--system`: Git lit et écrit dans le fichier de configuration système `/etc/gitconfig`.

**Remarque**

Lorsqu'aucune propriété n'est définie dans le contexte système ou utilisateur,
les fichiers de configuration `~/.gitconfig`(ou `~/.config/git/config`) et
`/etc/gitconfig` n'existent pas par défaut. Ils sont créés lorsque vous ajoutez
pour la premère fois une propriété de configuration dans ces contextes.

## Ordre de priorité

Pour une propriété de configuration donnée, git commence par chercher la valeur
correspondante dans le fichier de configuration local du dépôt courant, si elle
n'y est pas, il passe au fichier de configuration utilisateur, et enfin le
fichier de configuration système. Git s'arrête au premier fichier de configuration
contenant cette valeur.

**Remarque**

Git accepte des propriétés de configuration **multi-valeurs** dans le même fichier,
dans ce cas là, c'est la dernière valeur définie qui est prise en compte.

## Comportement par défaut

La commande `git config` agit par défaut sur le fichier de configuration local
d'un dépôt.

**Exercice:**

_Éléments d'entrée:_

 - Un dépôt git `~/mon-depot-git` est déjà créé dans votre dossier de travail.
 - L'éditeur de texte à utiliser est `vim`.

_Objectif(s):_

 1 - Consultez le fichier de configuration local du dépôt `mon-depot-git`
     dans un éditeur de texte et observez attentivement son contenu.

> Pour quitter l'éditeur `vim`, saisissez la séquence <kbd>Esc</kbd> puis `:q!` et <kbd>Enter</kbd>.

<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
