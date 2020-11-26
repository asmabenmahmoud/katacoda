
```
Précédemment,
- nous avons installé un Git Central (remote repository),
  ainsi que deux "Repository Locaux" (pour chaque équipe)
- les "équipes" ont effectué des développements sur leur Repository Local
  puis les ont reportés sur le Central
```
  
**A présent**
- Nous allons simuler un problème `conflit` de mise à jour du Repo Central,
  lorsqu'une équipe tente de travailler sur une ancienne version du Repository Central
- Nous allons Manipuler les commandes utiles pour gèrer ce conflit "commit","pull","reset","rebase","push"


Solution Mise en oeuvre:
  - l'équipe bloquée, devra récupèrer la dernière version -à jour- du Repositiory Central,
  - Puis fusionner en local son travail, avec celui de l'autre équipe,
  - et enfin "pusher" tous ses développements à jour vers le repository Central.

