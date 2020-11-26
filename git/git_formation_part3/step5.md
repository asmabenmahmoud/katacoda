Si vous voulez connaitre la valeur d'une propriété de configuration, cela est
possible à l'aide de l'option `--get`.

Cette option vous donne la valeur d'une propriété de configuration, si cette
propriété n'est pas définie, la commande `git config` ne renvoie rien.

**Remarque**

S'il y a plusieurs valeurs définies pour la propriété dans le fichier de
configuration, la commande renvoie uniquement la dernière valeur.

**Exemple**

Soit le fichier de configuration suivant:

    [user]
        name="John"
        name="Stan"

La commande `git config --get user.name` invoquée sur ce fichier, vous renvoie
la dernière valeur **i.e.** `"Stan"`.

Si vous voulez obtenir toutes les valeurs, utilisez plutôt l'option `--get-all`.

**Exercice**

_Éléments d'entrée_

- Un fichier de configuration utilisateur `~/.gitconfig`.
- L'éditeur de texte à utiliser est `vim`.

_Objectifs_

1- Quelle est la valeur de la propriété `user.email`.

2- Cette propriété a-t-elle une seule valeur ou plusieurs?

> Pour quitter l'éditeur `vim`, saisissez la séquence <kbd>Esc</kbd> puis `:q!` et <kbd>Enter</kbd>.



 <br/>
 <br/>
 <br/>
 <br/>
 <br/>
 <br/>
 <br/>
 <br/>
