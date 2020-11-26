
Mettez vous dans le répertoire _mon-depot-git_:
`cd ~/mon-depot-git`{{execute host01}}

Ajoutez l'adresse email:
`git config --add user.email votremail@mail.fr`{{execute host01}}

Maintenant, n'oubliez pas l'option **--global** lorsque vous ajoutez la propriété
**advice.hideHints**:
`git config --global --add advice.hideHints false`{{execute host01}}

Enfin visualisez vos changements:
   - Fichier local `vim ~/mon-depot-git/.git/config`{{execute host01}}
   - Fichier utilisateur `vim ~/.gitconfig`{{execute host01}}
