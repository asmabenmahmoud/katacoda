
**LES COMPOSANTS**
- Les trois principaux composants de Splunk sont présentés ci-dessous.

![splunk architecture](/dianlanta/courses/splunk/splunk_training_part2/assets/splunk_architecture.png)

#### 1) Indexer
- L'indexer traite les données du serveur, stocke les résultats dans des indexes sous forme d'événements, permettant une recherche et une analyse rapide.

- En indexant les données, les indexeurs créent un certain nombre de fichiers organisés en ensembles de répertoires par ancienneté et qui contiennent des données brutes compressées.

#### 2) Search Head

- Permet aux utilisateurs d'utiliser la langue de recherche pour rechercher les données indexées.

- Distribue les demandes de recherche des utilisateurs aux indexeurs

- Consolide les résultats et extrait les paires de valeurs de champ (clé/valeur) des événements à l'utilisateur

- fournissent également des outils pour améliorer l'expérience de recherche, tels que les rapports, les tableaux de bord et les visualisations

#### 3) Forwarder

- Ceux sont des agents Splunk qui consomment et envoient des données à l'index

- Requierent des ressources minimales et a peu d'impact sur les performances

- Résident sur les serveurs d'où proviennent les données

- Les données primaires sont fournies pour l'indexation
