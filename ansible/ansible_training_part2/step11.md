
> Modifier le playbook de l'exercice 5 (Installation, configuration et redémarrage du service Apache2)
> En plus de l'installation et configuration du serveur Apache, nous allons configurer un site Apache

>- Configurer [le vhost apache](https://www.linuxtricks.fr/wiki/virtual-hosts-avec-apache-vhosts): Utiliser le module template afin de créer le fichier de configuration Apache /etc/apache2/sites-available/monsite.conf sur la machine cible.

>   Le template jinja  /work_dir/training-files/vhost.j2 est disponible sur la machine source

>   Définir dans le playbook les variables utilisées dans le fichier jinja vhost.j2

>- Utiliser le module [command](https://docs.ansible.com/ansible/latest/modules/command_module.html?highlight=command%20modul) pour activer le site "monsite" (Rappel: la commande pour activer un site est: a2ensite nom_du_site)
