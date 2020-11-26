
## Votre identité
La première chose à faire après l'installation de **git** est de renseigner votre
nom et votre adresse de courriel.

C'est une information importante car toutes les validations dans **git**
utilisent cette information et elle est indélébile dans toutes les validations
que vous pourrez réaliser :

Définissez votre identité:

`git config --global user.name "John Doe"`{{execute host01}}

`git config --global user.email johndoe@example.com`{{execute host01}}

Cette étape n'est nécessaire qu'une fois si vous utilisez l'option `--global`,
et elle est à refaire de nouveau pour chaque dépôt si vous utilisez l'option
`--local` ou si vous omettez complètement l'option de portée.

> Dans le cas ou la machine sur laquelle vous travaillez est partagée avec
> d'autres utilisateurs,n'utilisez l'option `--system` que pour les paramètres
> partagés.

## Éditeur de texte

Maintenant, vous pouvez configurer **git** pour utiliser votre éditeur de texte
préféré, lorsque **git** vous demande de renseigner un message (Comme lorsque
vous oubliez de spécifier l'option `-m` lors d'un `git commit`) ou pour éditer
un fichier de configuration depuis **git**.

Dans cette exemple, on configure **git** pour utiliser l'éditeur de texte **vim**
par défaut:

`git config --global core.editor vim`{{execute host01}}


Vérifier vos paramètres:

`git config --list`{{execute host01}}
