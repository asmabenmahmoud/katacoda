
**La gestion de logs (LM** pour Log Management) comprend une approche de la gestion de grands volumes des messages de log  générés par l'ordinateur (aussi connu comme journaux d'évènements, journalisation, etc.). La gestion des logs concerne en général:

- La collecte des logs
- L'agrégation centralisée des logs
- Le stockage à long terme et la durée de rétention des logs
- La rotation des fichiers de logs
- L'analyse des logs (en temps réel et en vrac après une période de stockage)
- Présentation principalement sous forme de recherches, mais également de création de rapports
- Contenus et workflows connexes
- Divers cas pratiques d’utilisation couvrant tous les usages possibles des données de consignation dans tous les domaines possibles, bien au-delà du secteur informatique

![gestion logs](/dianlanta/courses/splunk/splunk_training_part1/assets/image1.jpg)


#### Généralité
Les principaux enjeux de l'implémentation de la gestion des logs concernent la sécurité, les opérations systèmes et réseaux et la conformité du système. Les logs sont générés par presque tous les appareils informatiques, et peut souvent être dirigé vers différents endroits à la fois locales, dans le système de fichiers ou à dans un système distant.

L'analyse effective de grands volumes de divers journaux peuvent poser de nombreux défis, tels que:

- **Le volume:** les journaux/logs peuvent atteindre des centaines de giga-octets de données par jour pour une grande organisation. La collecte, la centralisation et le stockage de données à ce volume peut être difficile.
- **Normalisation:** les journaux sont produites dans de multiples formats. Le processus de normalisation est conçu pour fournir une sortie commune pour l'analyse de diverses sources.
- **Vitesse:** La vitesse à laquelle les journaux sont produites à partir de dispositifs peuvent rendre la collecte et l'agrégation difficile
- **Véracité:** Journal des événements peut ne pas être exacte. Cela est particulièrement problématique à partir de systèmes qui effectuent la détection, tels que les systèmes de détection d'intrusion.

Les utilisateurs et les utilisateurs potentiels de la gestion du journal peuvent acheter des d'outils propriétaires complets  ou construire leur propre outil de gestion de logs et outils d'intelligence, ou bien utiliser un assemblage de composants open-sources, ou bien encore ou d'acquérir des (sous-)systèmes de fournisseurs commerciaux. La gestion des journalisations est un processus complexe et les organisations font souvent des erreurs dans leurs approches.

Par la suite, on introduira les principaux atouts de la gestion des logs.
