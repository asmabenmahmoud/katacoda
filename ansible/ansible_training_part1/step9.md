

Pour tester la connectivité vers les serveurs du groupe [web], et [db] définis dans le fichier hosts.ini, exécutez la commande Ansible 'ping' comme indiqué ci-dessous. 
Ici, ping est un module qui rempli une fonction particulière: "Tester si les hôtes peuvent être connectés"

Ce n'est pas un ping ICMP, c'est juste un module de test trivial qui requiert Python sur le nœud distant.
Pour les cibles Windows, utilisez plutôt le module win_ping.
Pour les cibles réseau, utilisez plutôt le module net_ping.

Nous verrons plus en détail divers modules et leurs exemples dans les sections suivantes.

#### 1) Tester la connexion en local
On utilisera la commande ansible.
Usage: ansible <host-pattern> [options] 

`ansible all -i hosts.ini -c local -m ping`{{execute T1}}

    all : le hote ou le groupe de hote. Ici la commande ping s'exécute sur tout les hotes (hotes managés)
    -i : le chemin vers l'inventaire . Ici c'est hosts.ini
    -m : Le nom du module a exécuter. Ici "ping"
    -c : type de connexion
    

Comme indiqué au début de la page, le module ping de Ansible n'est pas une demande ICMP. Au dela de ping/pong, il s'agit aussi d'un test
de la connexion SSH.

Cependant, dans la commande précédente nous avons utilisé l'option locale -c qui indique à Ansible de contourner le réseau afin que le client Ansible puisse exécuter des commandes locales sans avoir besoin d'une connexion SSH.

#### 2) Tester la connexion à distance
Afin de pouvoir lancer des commandes sur les hotes managés, la connexion SSH doit être fonctionnelle entre les machines managés et la vm Ansible.

Vous allez tester la commande ping vers le hôte "managed_node1" du groupe [web], mais cette fois ci sans l'option "-c local"

`ansible web -i hosts.ini -m ping`{{execute T1}}

Cela conduira à l'erreur suivante:

<pre style="color: red">
managed_node1 | UNREACHABLE! => {
    "changed": false,
    "msg": "[Errno None] Unable to connect to port 22 on 172.19.0.3",
    "unreachable": true
}
</pre>




