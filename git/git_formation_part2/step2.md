Étant donné que l'historique complet du projet se trouve sur votre disque local,
et que la plupart des opérations dans **Git** ne requièrent que des fichiers et
des ressources locales, cela implique que vous pouvez continuer à travailler sur
votre projet en local, même en cas de coupure du réseau, et la plupart des
opérations semblent presque instantanées.

**Par exemple, à titre de comparaison:**
- Pour parcourir l'historique du projet, **Git** n'a pas besoin d'aller
  sur le serveur pour obtenir l'historique et l'afficher - il le lit
  simplement directement à partir de votre base de données locale. Cela signifie
  que vous voyez l'historique du projet presque instantanément.
  Dans de nombreux autres systèmes, cela est impossible ou presque.

- Dans `Perforce`, vous ne pouvez pas faire grand chose lorsque vous n’êtes pas
  connecté au serveur. Et dans `Subversion` et `CVS`, vous pouvez modifier des
  fichiers, mais vous ne pouvez pas appliquer de modifications à votre base de
  données (car votre base de données est hors ligne).
