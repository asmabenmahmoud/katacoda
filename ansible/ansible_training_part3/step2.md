
Les modules sont les principaux éléments constitutifs d’Ansible. Ils sont essentiellement des scripts réutilisables. Ils sont  utilisés à partir de la ligne de commande ou dans une tâche 'tasks' par les playbooks d’Ansible qu'on verra ultérieurement. 

Il existe une large liste de modules Ansible, mais vous pouvez également écrire les vôtres. Vous devrez l’écrire en Python.

Il est important de garder en permanence une fenêtre de votre browser internet préféré avec la documentation des modules :

https://docs.ansible.com/ansible/latest/modules/modules_by_category.html

Selon votre cas et votre besoin, il faudra trouver le module adapté, comprendre les arguments d'entrée à renseigner pour votre cas de figure. 


Chaque module prend en charge la prise d'arguments. Presque tous les modules prennent des arguments sous le format 'clé = valeur', délimités par des espaces. 

##### _Syntax:_ 
ansible $TARGET -m $MODULE -a $MODULE_ARGUMENTS

Pour Afficher le manuel d'un module: ansible-doc $MODULE

##### _Valeurs de retour_

Les modules Ansible renvoient normalement une structure de données qui peut être enregistrée dans une variable ou vue directement lors de la sortie par le programme Ansible. Chaque module peut éventuellement documenter ses propres valeurs de retour uniques (visibles via ansible-doc et sur le site officiel).

Sur le site officiel Ansible vous pouvez par exemple trouver les valeurs de retour du module ["archive"](https://docs.ansible.com/ansible/latest/modules/archive_module.html#archive-module) présenté comme suit:

![archive_return_value](/devopsteam/courses/ansible/ansible_training_part1/assets/archive_module_return_value.png)

La page disponible dans le lien suivant couvre les valeurs de retour communes à tous les modules:

https://docs.ansible.com/ansible/latest/reference_appendices/common_return_values.html#common


##### IMPORTANT:

<pre style="color: orange">
Les commandes ci-dessous permettent de préparer le Lab nécessaire 
à la réalisation des exercices.

Une étape réalise un téléchargement entre GitHub et la plateforme
katacoda.

Des lenteurs peuvent apparaitre et la préparation du Lab prendra
plus de temps. Donc, attendre 1 min avant de lancer la première
commande.

Si vous obtenez le message suivant :
</pre>

<pre style="color: red">
Error : No such container
</pre>
<pre style="color: orange">
alors le téléchargement des conteneurs n’est pas finalisé.
Pour cela, attendre 30 secondes supplémentaire et 
recommencer et ce jusqu’à ne plus avoir l’erreur.
</pre>


Lancez les commandes suivantes afin de préparer vos environnements.

`a() { docker exec -it ansible_node bash -c "cd /work_dir; echo 'PS1='\''ansible# '\' >> /root/.bashrc; bash"; } && a`{{execute T1}}

`n1() { docker exec -it managed_node1 bash -c "cd /work_dir; echo 'PS1='\''managed_node1# '\' >> /root/.bashrc; bash"; } && n1`{{execute T2}}

`n2() { docker exec -it managed_node2 bash -c "cd /work_dir; echo 'PS1='\''managed_node2# '\' >> /root/.bashrc; bash"; } && n2`{{execute T3}}




