
#### 1) Installer Ansible sur la machine de contrôle: host 1

Plusieurs solutions possibles pour l'installation :

- solution1: utilisation de package rpm
- solution2: l'utilisation de pip install   (gestionnaire des packages/librairie Python où Ansible est pré-packagé)

Nous avons choisi dans cette formation l'installation via la commande "pip"

1.Vérifier que le package python-pip est bien installé
   `apt list --installed python-pip`{{execute T1}}
  
Si le package python-pip n'est pas installé, vous allez avoir un résultat comme ci-dessous. Il faut donc installer le package.
Si ce n'est pas le cas alors sauter l'étape 2 et passer à l'étape 3

```
Listing... Done
```

2.Sinon installer le package python-pip
   `apt-get install -y python-pip`{{execute T1}} 

3.Installer Ansible avec la version 2.7.7
   `pip install ansible==2.7.7`{{execute T1}}
   
4.Vérifier que Ansible est bien installé
   `ansible --version`{{execute T1}}
   
   
#### 2) Installer Python sur les serveurs managés
##### 1.Vérifier que le package python est bien installé
- Sur le managed_node1 `apt list --installed  python`{{execute T2}}
- Sur le managed_node2 `apt list --installed  python`{{execute T3}}

Si le package Python n'est pas installé, vous allez avoir un résultat comme ci-dessous. Il faut donc installer le package.
Si ce n'est pas le cas alors sauter l'étape 2 et Continuer vers la page suivante.
```
Listing... Done
```

##### 2.Installer le package python
- Sur le managed_node1 `apt-get install -y python`{{execute T2}}
- Sur le managed_node2 `apt-get install -y python`{{execute T3}}
