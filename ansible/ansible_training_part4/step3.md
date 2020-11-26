

*Plus d'informations sur utilisation des modules files: 
[Documentation module file](https://docs.ansible.com/ansible/latest/modules/list_of_files_modules.html?highlight=file%20module)

Rappel: Nous vous conseillons de sauvegarder vos playbooks dans un éditeur externe à votre session Katacoda et d'avoir en permanence un onglet de votre Browser Internet avec la documentation sur les modules Ansible ouvert.

> Créer un fichier playbook_ex01.yml dans votre espace de travail /work_dir de la machine Ansible

> Ecrire le playbook "playbook_ex01.yml"

> -Le groupe sur lequel s'exécutera les tâches: web

> -Tâche 1: Permet de créer un dossier /etc/training/training.d avec le module « file »

> -Tâche 2: Permet de copier le fichier depuis /work_dir/training-files/config.txt de la machine Ansible vers /etc/training/training.d de la machine cible avec le module « copy ». Pour cela observer bien les options en entrée du module "copy"
