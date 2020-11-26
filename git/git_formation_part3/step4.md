Lorsque vous souhaitez supprimer une valeur de configuration, vous utiliserez
l'option `--unset` (`--add` pour ajouter une valeur, comme on l'a vu précédemment).

La commande pour la suppression a le format suivant:

    git config [scope] --unset <section>.<key>

Dans la commande ci-dessus:

- _Scope_: est le contexte de configuration (`--system`, `--global`, `--local`)
  est optionnel, si vous l'omettez, git utilisera le scope `--local` par défaut.
- _Section_: le nom du bloc de configuration auquel la propriété _key_ appartient.
- _Key_: la propriété que vous souhaitez supprimer.

**Exemple:** `git config --unset core.editor`

Dans l'exemple ci-dessus, on demande à git de supprimer la propriété `editor`,
du bloc de configuration `core`, et qui est définie dans le fichier de configuration
local du dépôt git dans lequel la commande est invoquée.


**Exercice:**

_Éléments d'entrée_

- Un dépôt git `~/mon-depot-git` est déjà créé dans votre dossier de travail.
- Une propriété de configuration `color.branch` est définie localement dans le
  fichier de configuration local du dépôt `mon-depot-git`.
- L'éditeur de texte à utiliser est `vim`.

_Objectif(s)_

- Consultez le fichier de configuration local pour voir la valeur de `color.branch`
- Supprimez cette propriété et vérifiez qu'elle a bien disparu du fichier de
  configuration.

> Pour quitter l'éditeur `vim`, saisissez la séquence <kbd>Esc</kbd> puis `:q!` et <kbd>Enter</kbd>.



 <br/>
 <br/>
 <br/>
 <br/>
 <br/>
 <br/>
 <br/>
 <br/>
