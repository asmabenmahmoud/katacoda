Pour lister les toutes les propriétés de configuration définies dans tous les
fichiers de configuration, sans les ouvrir un par un, utilisez l'option `--list`:

`git config --list`{{ execute T1 }}

Si vous souhaitez filtrer et n'afficher que les propriétés définies dans un
fichier spécifique à un contexte, ajoutez l'option de contexte `--system`,
`--global` ou `--local`.

**Exemple**

`git config --global --list`{{execute host01}}

Si vous voulez connaitre le fichier de configuration qui à l'origine de chaque
définition, vous pouvez le faire en rajoutant l'option `--show-origin`.
Cette option n'est disponible qu'à partir des versions git `> 2.8`.

`git config --show-origin --list`{{execute host01}}
