
**LES TYPES D'ENTREE DE DONNEES**

Splunk prend en charge de nombreux types d'entrée de données

- **Fichiers et répertoires:** surveillance des fichiers texte et / ou des structures de répertoires contenant des fichiers texte
- **Données réseau:** écoute sur un port pour les données réseau
- **Sortie de script:** exécution d'un script et utilisation de la sortie du script comme entrée
- **Journaux Windows:** surveillance du journal des événements Windows, Active Directory, etc.
- **HTTP:** utilisation du collecteur d'événements HTTP
- Et beaucoup d'autres

![what Splunk can index](/dianlanta/courses/splunk/splunk_training_part2/assets/what_splunk_can_index.png)

Vous pouvez ajouter des entrées de données avec:
- Applications et add-ons de splunkbase
- Splunk Web
- Command Line Interface
- En éditant inputs.conf

Il existe 3 méthodes pour télécharger des données vers Splunk, elles sont décrites ci-dessous:

**TELECHARGEMENT D'ENTREE**
- Via la console Splunk - Téléchargement de fichier local dans Splunk Enterprise
- Il n'est indexé qu'une seule fois et n'est jamais mis à jour.
Ceci n'est pas utile en environnement de production.

**MONITEUR D'ENTREE**
- Via la console Splunk
- Monitore les fichiers vus dans les types d'entrée de données
- Le fichier peut-être monitoré une seule fois ou continuellement

**FORWARDER**
- Les forwarders sont des agents installés sur les serveurs et qui collectent et transmettent vers l'indexeur les données préalablement définies dans le fichier inputs.conf
- Dans la plupart des environnements de production, les forwardeurs seornt utilisés comme principale source d'entrée de donnée
