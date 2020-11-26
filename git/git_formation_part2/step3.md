Dans **Git**, tout est vérifié par une somme de contrôle avant d'être stocké et
par la suite cette somme de contrôle, signature unique, sert de référence.

Cela signifie qu'il est impossible de modifier le contenu d'un fichier ou d'un
répertoire sans que Git ne s'en aperçoive. Cette fonctionnalité est ancrée dans
les fondations de **Git** et fait partie intégrante de sa philosophie. Vous ne
pouvez pas perdre des données en cours de transfert ou corrompre un fichier sans
que **Git** ne puisse le détecter.

Le mécanisme que **Git** utilise pour réaliser les sommes de contrôle est appelé
une empreinte **SHA-1**.

C'est une chaîne de caractères composée de **40 caractères hexadécimaux**
`(de 0 à 9 et de a à f)` calculée en fonction du contenu du fichier ou de la
structure du répertoire considéré.

Une empreinte **SHA-1** ressemble à ceci :

    24b9da6552252987aa493b52f8696cd6d3b00373

Vous trouverez ces valeurs à peu près partout dans **Git** car il les utilise
pour tout. En fait, **Git** stocke tout non pas avec des noms de fichiers, mais
dans la base de données **Git** indexée par ces valeurs.
