Le nom d'une variable de configuration **git** est une chaîne de caractère,
composée de deux parties séparées par un point `.`, la première représente le
nom d'un **bloc/section de configuration**, et la seconde le nom de
**la propriété de configuration** appartenant à ce bloc.

**Exemple:** `core.editor`, `user.email`, ...

Dans l'exemple ci-dessus `email` est une propriété de configuration définie dans
la section de configuration `user`.

**Git** utilise des fichiers de configuration sous format texte, vous pouvez
modifier les valeurs de configuration manuellement en éditant directement ces
fichiers, tout en respectant la syntaxe.

**Exemple:**

    [user]
         name = "toto"

Cependant, il est recommandé de passer par la commande `git config` quand c'est
possible.

Pour définir une propriété de configuration **git**, on utilise la commande:

`git config --add <section>.<key> <value>`.

Où:
- **section**: Est le bloc de configuration dans lequel vous définissez la propriété.
- **key**: Est la propriété appartenant à la section.
- **value**: La valeur que vous souhaitez assigner à cette propriété, les guillemets
  sont optionnels, **sauf si la valeur contient des espaces**, par exemple: `"John Doe"`.

> Lorsque vous ajoutez une propriété dans un fichier de configuration via la
> commande `git config`, si la propriété a déjà une valeur dans ce fichier, **git**
> ajoutera une ligne avec votre nouvelle valeur sans altérer les autres.
> **Git** prend en compte seulement la dernière ligne.

**Exercice:**

_Éléments d'entrée:_

- Un dépôt git `~/mon-depot-git` est déjà créé dans votre dossier de travail.
- L'éditeur de texte à utiliser est `vim`.

_Objectif(s):_

1- Ajoutez votre email (propriété de configuration `user.email`) dans le fichier
   de configuration local du dépôt `~/mon-depot-git`.

2- Ajouter la propriété de configuration `advice.hideHints` avec la valeur `false`,
   dans le fichier de configuration utilisateur.

3- Vérifiez avec l'éditeur de texte `vim` les changements opérés dans les fichiers
   de configuration global `~/.gitconfig` et local `.git/config`.

> Pour quitter l'éditeur `vim`, saisissez la séquence <kbd>Esc</kbd> puis `:q!` et <kbd>Enter</kbd>.


 <br/>
 <br/>
 <br/>
 <br/>
 <br/>
 <br/>
 <br/>
 <br/>
