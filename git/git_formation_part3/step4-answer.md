
Mettez vous dans le répertoire _mon-depot-git_:
`cd ~/mon-depot-git`{{execute host01}}

Ouvrez le fichier de configuration et chercher la valeur de la propriété **color.branch**:
`vim ~/mon-depot-git/.git/config`{{execute host01}}

Supprimez la propriété:
`git config --unset color.branch`{{execute host01}}

Enfin visualisez vos changements:
`vim ~/mon-depot-git/.git/config`{{execute host01}}
