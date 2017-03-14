# Duniter sur Yunohost derrière une box privatrice (type livebox)

Ce tutoriel vient en complément de celui de Moul, https://forum.duniter.org/t/installation-d-un-noeud-duniter-a-l-aide-de-yunohost/1420,  pour répondre au problème spécifique apporté par l'utilisation d'un modem privateur tel que la livebox.

Lisez les deux tutoriels avant de vous lancer.

Si pour une raison ou une autre vous n'avez guère le choix de votre FAI (Fournisseurs d’Accès à Internet), parce que vous vous situez en zone blanche par exemple et que vous devez composer avec un modem privateur, mais souhaitez tout de même auto-héberger un noeud Duniter à l'aide de Yunohost, vous pourriez trouver des éléments d'aide dans le tutoriel suivant.
Si vous avez le choix, c'est peut être l'occasion de changer de FAI et de se poser la question des FAI membres de la Fédération French Data Network qui ont une politique favorable à l’auto-hébergement  : https://yunohost.org/#/isp_fr

Ce tutoriel est écrit suite à mon expérience d'installation d'un noeud Duniter dans Yunohost 2.5 sur un Raspberry Pi 3 (RPi) sur lequel est installé Raspbian Jessie Lite qui se trouve derrière une Livebox 3 (Play) qui ressemble à ça...
[https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Livebox_Play_en_exposition.jpg/220px-Livebox_Play_en_exposition.jpg](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Livebox_Play_en_exposition.jpg/220px-Livebox_Play_en_exposition.jpg)

Avant même d'installer Yunohost, comme indiqué ici https://yunohost.org/#/isp_box_config_fr ,vous devez ouvrir les ports suivant de votre livebox : 
TCP :

    Web : 80 (HTTP), 443 (HTTPS)
    SSH : 22
    XMPP : 5222 (clients), 5269 (serveurs)
    Courriel : 25, 465 (SMTP), 587 (SMTP avec chiffrement), 993 (IMAP)
    DNS : 53

UDP:

    DNS : 53

Il faut que votre RPi soit allumé et connecté à votre livebox. La livebox lui attribut une adresse IP qu'il va falloir trouver.
Accédez à votre livebox en tapant son adresse IP dans votre navigateur, par défaut c'est  http://192.168.1.1/ .
Trouvez l'adresse IP de votre RPi sur l'interface de votre livebox. Dans l'image ci dessous, j'ai déjà identifié et renommé mon RPi en Yunohost (le votre n'aura sans doute pas encore ce nom là).
<img src="https://forum.duniter.org/uploads/default/original/2X/3/3a78048fc4266a23b7c76ca86f3e9a1b7692fbcc.png" width="671" height="500">
[Vous pouvez aussi brancher un écran sur votre RPi, vous identifier et taper `ifconfig`.]

Ensuite, pour accéder à l'interface administrateur de votre livebox, entrez le mot de passe qui, par défaut, se compose des 8 premiers caractères de la clé de sécurité (celle que vous utilisez pour le wifi).

Rendez-vous d'abord dans configuration avancée/DHCP.
Descendez sur "Baux DHCP statiques" et sélectionnez dans le menu déroulant votre RPi. Les champs "adresse IP" et "adresse MAC" vont se compléter automatiquement. Cliquez sur ajouter. Ainsi, votre RPi aura toujours la même adresse IP en local, même après un reboot du RPi ou de la livebox.

Rendez-vous dans le second onglet, configuration avancée / NAT/PAT.
Vous allez devoir entrer une règle pour chaque port.
Donné un nom à cette règle, inscrivez le port qui correspond dans "port internet" et "port externe", puis sélectionnez votre RPi dans le menu déroulant "appareil" et cliquez enfin sur ajouter. Ça doit ressembler à ça : 
<img src="https://forum.duniter.org/uploads/default/original/2X/3/35d9a8cbc8a6e556851d9a317397ec209177d62d.png" width="690" height="298">
<img src="https://forum.duniter.org/uploads/default/original/2X/5/547cc9bd74d15c3cd3746ebbe70185241a4f0262.png" width="690" height="254">

Ensuite, à gauche, rendez-vous dans "Configuration pare-feu". Cochez "faible" et cliquez sur "enregistrer".

Redémarrez votre livebox et vous pouvez installer Yunohost.

 Si vous cherchez comment installer Yunohost, tout est expliqué très simplement ici en français : https://yunohost.org/#/install_on_raspberry_fr . Cependant, avant de vous lancer dans l'étape 4 de post-installation (https://yunohost.org/#/postinstall_fr), que vous ayez un nom de domaine à vous ou que vous profitiez des noms de domaine offert par Yunohost, vous allez devoir résoudre le problème d'adresse IP dynamique. Orange ne propose pas d'adresse IP fixe sur Internet.
Si vous possédez un nom de domaine chez OVH, vous pouvez suivre ce tutoriel pour profiter de leur service Dynhost : https://docs.ovh.com/fr/fr/web/domains/utilisation-dynhost/ (je ne cautionne pas leur choix de "Les outils à utiliser" non libre, je vous propose un autre outil libre ci-après).
Si vous souhaitez profiter des noms de domaine offert par Yunohost ou que vous possédez un nom de domaine chez un concurrent d'OVH, vous pouvez suivre ce tutoriel : https://yunohost.org/#/dns_dynamicip_fr
Pour le choix du client de DNS dynamique, tout comme dans la documentation de Yunohost, je vous conseille d'installer "ddclient" dans votre RPi. Je vous propose ce dont j'ai moi eu besoin mais vous pouvez vous aider de ce tutoriel si besoin : https://blog.developpez.com/brutus/p6316/ubuntu/configurer_dynhost_ovh_avec_ddclient . 

`sudo apt-get install ddclient`

Répondez aux questions sans trop vous attardez car vous allez modifier le fichier de configuration de ddlclient en tappant ensuite :

`sudo nano /etc/ddclient.conf`

Voici comment est configuré mon fichier ddclient.conf (j'utilise le DynHost de OVH) : 

    # Configuration file for ddclient generated by debconf
    #
    # /etc/ddclient.conf

    daemon=300
    pid=/var/run/ddclient.pid
    ssl=yes
    protocol=dyndns2
    use=web, web=checkip.dyndns.com/, web-skip='IP Address'
    server=www.ovh.com
    login=votre login
    password='votre mot de passe'
    votre.nom.de.domaine.fr

    daemon=300
    pid=/var/run/ddclient.pid
    ssl=yes
    protocol=dyndns2
    use=web, web=checkip.dyndns.com/, web-skip='IP Address'
    server=www.ovh.com
    login=votre login
    password='votre mot de passe'
    duniter.votre.nom.de.domaine.fr

Vous devez bien sûr adapter les éléments suivants à votre situation :
server=www.ovh.com (cela dépendra de votre fournisseur de DynDNS)
login=votre login
password='votre mot de passe'
votre.nom.de.domaine.fr 

Si vous souhaitez utiliser votre Yunohost pour autre chose que Duniter, vous avez besoin de deux noms de domaine, un spécifique pour Duniter et un pour les autres applications. J'ai choisi l'option du sous domaine, d'où
`votre.nom.de.domaine.fr` et `duniter.votre.nom.de.domaine.fr`
mais vous pourriez très bien avoir deux nom de domaine très différents
`votre.nom.de.domaine.pour.autres.apps.fr` et `votre.nom.de.domaine.pour.duniter.fr`

    CTRL+O pour enregistrer
    CTRL+X pour quitter nano

tapez enfin

`sudo reboot`

Si votre FAI vous offre une adresse IP fixe (autre qu'orange) et que vous possédez un nom de domaine, vous allez devoir configurer la zone DNS de votre/vos (sous)nom de domaine pour rediriger vos noms de domaines vers votre adresse IP fixe à l'aide des tutoriels suivants : 
https://yunohost.org/#/dns_config_fr
https://yunohost.org/#/dns_subdomains_fr
avec l'exemple de OVH : https://yunohost.org/#/OVH_fr

Vous pouvez passer à la post installation de Yunohost en précisant votre nom de domaine principal.
N'oubliez pas d'ajouter ensuite le nom de domaine spécifique à Duniter dans l'interface admin de Yunohost avant d'installer Duniter soit par l'interface graphique soit en ligne de commande comme l'explique Moul dans son tutoriel : https://forum.duniter.org/t/installation-d-un-noeud-duniter-a-l-aide-de-yunohost/1420
N'oubliez pas que les mises à jour se font, pour l'heure, uniquement en ligne de commande.

On approche de la fin.
Vous pouvez déjà accéder à votre RPi et donc à votre noeud Duniter grâce à votre nom de domaine depuis l'extérieur mais chez vous, la livebox ne vous le permet pas (ben oui, elle est privatrice de liberté). Vous ne pouvez y accéder que par l'adresse IP local, celle que vous avez rendu fixe dans l'interface admin de votre box. La livebox ne permet pas non plus de redirection DNS (la SFR box le permet apparement, voir https://yunohost.org/#/dns_local_network_fr ), donc vous devez le faire dans chaque ordinateur de votre maison (attention, il faudra enlever cette redirection quand vous sortez de chez vous avec cet ordinateur!!!!!!!!). Dans votre ordinateur tournant sous Linux (ordipoche sous android aussi), vous devez modifier le fichier /etc/hosts :

`sudo gedit /etc/hosts`

et y ajouter les lignes suivantes :

    Adresse-IP-de-RPi votre.nom.de.domaine.fr 
    Adresse-IP-de-RPi duniter.votre.nom.de.domaine.fr 

Enfin, une fois que vous accédez à votre noeud Duniter via votre navigateur, à l'adresse duniter.votre.nom.de.domaine.fr /webui (/webui est important)
rendez-vous dans Settings/Network et modifiez pour obtenir la configuration suivante (Vous pouvez choisir un autre local port) : 
<img src="https://forum.duniter.org/uploads/default/original/2X/9/918defdec121545c51d28296db24637e48f1d85a.png" width="690" height="301">

Cliquez sur "Save and Apply Network Settings"

Retournez dans l'interface d'admin de votre livebox à "configuration avancée/NAT/PAT" (rappel, on accède normalement à la livebox par l'adresse http://192.168.1.1/ )
et ajoutez le port local de Duniter à la liste précédente (cliquez sur "ajouter"):
<img src="https://forum.duniter.org/uploads/default/original/2X/9/90ff1835ee8156451041464f11f2e653ff392747.png" width="690" height="35">

Redémarrez la livebox 
et le RPi :

`sudo reboot`

une fois reconnecté en SSH

`duniter webrestart`

Cette fois, c'est bon, votre noeud Duniter sera accessible et visible par le réseau.

[Si vous avez l'intention d'utiliser votre Yunohost aussi pour héberger vos emails, vous devez aussi suivre ces explications https://yunohost.org/#/isp_orange_fr .]