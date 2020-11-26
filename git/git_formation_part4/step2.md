Nous savons maintenant comment initialiser un dépôt localement, maintenant qu'en
est-il de récupérer la copie d'un dépôt distant?

Il est assez fréquent que vous soyez amené à travailler sur un dépôt git existant, sur
un serveur distant. Dans ce cas, vous devez récupérer une copie en local à l'aide
de la commande `git clone <repository-url>`.

- _repository-url_: Une `url` git valide, d'un dépôt sur un serveur distant
 (Github, Bitbucket, Gitlab, ...)

Une `url` git, est donnée par l'expression régulière suivante:

![Git url](/deopsteam/courses/git/git_formation_part4/assets/git-regex.png)


**Exercice:**

_Éléments d'entrée:_

 - Un dépôt git `depot-distant` est disponible sur le serveur nommé `master`.
 - Vous pouvez vous connecter sur ce serveur via le compte utilisateur `git` sans mot de passe.
 - L'éditeur de texte à utiliser est `vim` ou `nano`.

_Objectif(s):_

 1 - Cloner dans votre répertoire personnel le dépôt distant `depot-distant`
     qui se trouve dans le répertoire `/opt/git/` sur le serveur `master`.
