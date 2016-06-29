# L'expérimentation Meta_Brouzouf est terminée !

Nous y sommes ! 14 mois après le lancement de la monnaie de test nommée *Meta_Brouzouf* le 21 janvier 2015, il est temps pour nous de délaisser cette monnaie et "stopper" l'expérimentation afin de passer à l'étape supérieure !

Mais pour quelles raisons ? Que va-t-il advenir de cette monnaie ? Et surtout, quelle est la suite ?!

Quelques éléments de réponse.
## Rappels sur le Meta_Brouzouf

Pour ceux qui n'auraient pas suivi de près cette expérimentation, voici quelques rappels permettant de situer le contexte.
### Le but initial : la naissance de logiciels clients

Le projet uCoin débutait durant l'été 2013. Suite à une année et demi de développement, janvier 2015, les bases étaient considérées posées et les premières bribes de code prêtes à être testées. Il était alors important de mettre à disposition une première monnaie, fut-elle de test, pour permettre à d'autres développeurs de produire des *logiciels clients* possédant des interfaces graphiques facilitant l'utilisation de la monnaie.

<center>[![](https://camo.githubusercontent.com/39705402deb44e50a1b48b5ed1206394593278dd/68747470733a2f2f7261772e6769746875622e636f6d2f75636f696e2d696f2f73616b69612f6d61737465722f73616b69612e706e67)](http://sakia-wallet.org)</center> <center>_Logo du premier client : le logiciel Sakia_</center>

En effet, bien que uCoin soit le logiciel au cœur de la monnaie, son rôle *n'est pas* de s'occuper de *vos* transactions en particulier, *mais de traiter tous les documents* permettant de la faire vivre.

Ce sont les logiciels clients qui, eux, permettent l'utilisation de la monnaie supportée par le logiciel uCoin en produisant les documents correspondant à vos actions *puis de les envoyer au réseau* afin qu'ils soient traités : il peut s'agir d'une transaction pour payer quelqu'un, d'une certification d'un individu de la toile de confiance ou encore d'une demande d'adhésion à la communauté monétaire.

Le logiciel uCoin, quant à lui, ne fait que traiter ces documents et les ajouter au registre commun de la monnaie nommé *Blockchain* et qui contient l'ensemble des données du réseau : les unités monétaires, les transactions effectuées et les individus constituant la toile de confiance.

<center>![image](https://cloud.githubusercontent.com/assets/969136/13917314/40084810-ef60-11e5-86f9-eacfb58b9062.png)</center> <center>_Logo de l'application "Android App"_</center>

#### Les premiers clients

Force est de constater que cet objectif, à la fin de l'expérimentation, a été atteint ! De valeureux développeurs se sont donnés corps et âme pour produire les précieux logiciels qui suivent :

* [Sakia](http://sakia-wallet.org), un logiciel de bureau complet pour   Linux, Mac et Windows
* [uCoin   App](https://play.google.com/store/apps/details?id=io.ucoin.android),   application pour votre smartphone Android
* [uCoinWallet](https://play.google.com/store/apps/details?id=io.ucoin.android.wallet),   autre application pour smartphone Android
* [Cesium](http://cesium.ucoin.fr/), un client toute plateforme qui   fonctionne dans votre navigateur favori

#### Et même un premier paquet du serveur !

Il est intéressant de noter qu'un contributeur actif de l'équipe [YunoHost](http://yunohost.org) a également développé [un paquet uCoin pour YunoHost](https://github.com/ucoin-io/ucoin_ynh) facilitant grandement l'installation de uCoin aux adeptes de l'auto-hébergement !

<center>[![](https://avatars1.githubusercontent.com/u/1519495?v=3&s=200)](http://yunohost.org/)</center>

### Les limites connues

Toutefois, cette expérimentation était dès le départ pensée et construite pour constituer **une monnaie de test**. Celle-ci n'avait donc pas vocation a durer, mais plutôt de tester l'application dans des conditions plus réalistes afin d'essuyer les premiers plâtres et éviter les erreurs les plus grossières.

En l'occurrence, nous avons choisi des paramètres monétaires incompatibles avec un fonctionnement à long terme :

* une croissance monétaire de **10% par jour**, plutôt que par an
* une nombre minimal de **3 certifications** pour être membre
* une durée de validité des certifications et adhésions **limitée à 1 mois**

Il faut bien comprendre que **10% par jour** plutôt que par an est une différence énorme, en effet la masse monétaire croit exponentiellement : au cours d'une année (c'est-à-dire après révolution complète de la Terre autour de son orbite), nous créons en réalité **1,166,641,437,000,000 fois plus de monnaie** qu'à la normale. Vous lisez bien : il s'agit d'une croissance **1 million de milliard de fois** plus rapide que 10% par an. La monnaie ne peut pas prendre de valeur à ce rythme, ce qui l'empêche de servir d'intermédiaire d'échange à moyen et long terme.

Également, le minimum de **3 certifications** pour être membre est suffisant pour une communauté d'une dizaine de membres mais devient beaucoup trop léger pour une communauté plus grande car cette règle devient trop facile à passer, et les faux comptes ne sont plus gênés par cette contrainte (ils le restent toutefois par la règle de distance).

Enfin, la durée de vie de **1 mois** pour les certifications et adhésions est bien trop faible. Bon nombre de membres de la communauté de test se sont vus rapidement exclus du fait de cette faible durée, leurs certifications et adhésion ayant expiré. Une valeur de **6 mois** serait déjà plus acceptable.

Pour ces raisons, aucune chance que cette monnaie ne perdure dans le temps.

<center>![](http://forum.ucoin.io/uploads/default/original/1X/da2e4d72317b4bb205d2b56001bb1add75435113.png)</center>

## Les résultats de l'expérimentation

Malgré ces paramètres qui augurent la fin précoce de cette monnaie de test, celle-ci a totalement joué son rôle notamment car [plusieurs logiciels clients sont nés](#lespremiersclients), mais aussi pas moins de **115 utilisateurs** ont activement participé à la monnaie, et ce malgré la jeunesse du projet qui demande un certain effort avant d'arriver au statut d'individu créateur de monnaie.

En effet pour réussir à créer son compte il a fallu pour chacun d'eux :

* installer le logiciel client Sakia
* suivre un [tutoriel en   anglais](https://forum.ucoin.io/t/tutorial-subscribe-to-the-testing-currency/143)   pour créer son identité dans Sakia, se connecter au réseau puis publier sa   demande d'adhésion à la communauté
* faire une demande explicite, écrite sur le [forum   uCoin](https://forum.ucoin.io) avec quelques preuves de son identité afin   de recevoir des certifications

C'est grâce à ces personnes que nous avons pu débusquer bon nombre de bugs, mineurs ou majeurs, mais également identifier les limites du protocole dans sa version initiale qu'il aura fallu corriger pour atteindre des tailles de communauté plus grandes, ce qui est important pour que la monnaie ait une réelle efficacité.



### Quelques chiffres

Pour clôturer ce post et marquer la fin de cette monnaie de test, nous vous proposons quelques chiffres tirés de la [Blockchain](https://fr.wikipedia.org/wiki/Cha%C3%AEne_de_blocs), base de données publique partagée par l'ensemble du réseau utilisateur de la monnaie, et que vous pouvez donc vous-même consulter et exploiter :

* **424** années simulées
* **137 identités** publiées dont **115 identités** ayant atteint le statut   de membre (et donc ayant créé de la monnaie)
* **1676 certifications** d'identité effectuées
* **466** demandes d'adhésions / d'actualisation envoyées
* **1191 transactions** réalisées
* **7193** dividendes (DU) ont été créés (1 dividende / jour / membre)
* **1,820,920,587,213,340,000,000** Meta_Brouzouf (unités de monnaie) créés

### L'arrêt de la monnaie

> Je ne comprends pas, je pensais que uCoin était basé sur un modèle en pair-à-pair (P2P) et que donc cet outil n'était pas centralisé ? Comment pouvez-vous donc "stopper", "arrêter" l'expérimentation si moi, avec mon nœud personnel, je décide de continuer l'aventure ?

En réalité, **nous ne pouvons pas forcer l'arrêt de la monnaie**. En effet, son infrastructure est bien de type P2P. Et donc si 3 membres décident de continuer à faire fonctionner cette monnaie en laissant chacun leur nœud uCoin fonctionner tout en se certifiant mutuellement, alors la monnaie continuera de fonctionner.

Simplement, ces 3 membres auront une monnaie "à eux", seront les seuls à en créer et probablement les seuls à l'accepter et l'utiliser.

Cet aspect P2P est crucial à nos yeux puisqu'il rend extrêmement difficile la prise de contrôle par quelques uns d'une monnaie libre, notre outil d'échange commun dont la durée d'existence vise à dépasser celle d'un être humain.

Or si nous souhaitons réaliser une monnaie libre, celle-ci doit être suffisamment robuste et à l'épreuve du temps : pour nous, seuls les systèmes décentralisés (pair-à-pair) sont à même de remplir cet objectif. C'est la raison pour laquelle uCoin est pair-à-pair.
### Pourquoi arrêter cette monnaie ?

Les objectifs ont été atteints, et surtout nous rencontrons des limites techniques qui ne permettent plus d'assurer le bon fonctionnement du logiciel.

Bien que celui-ci fonctionne toujours et que des utilisateurs peuvent faire perdurer l'expérimentation, nous ne souhaitons pas assurer davantage la cohérence des données.

Il se peut donc que les montants transférés deviennent incorrects, ou que les logiciels clients perdent les pédales ! N'en soyez pas surpris, nous ne le serons pas, et surtout nous regardons déjà dans une nouvelle direction.
## Et après ?

Comme dit précédemment, cette monnaie de test a été l'occasion de découvrir les limites de la 1ère version du protocole, estampillée sobrement **0.1**.

Nous avons dores et déjà implémenté sa suite, la version **0.2** qui apporte un grand nombre de nouveautés. Et donc, que va-t-il se passer ?

Les semaines à venir vous le diront.

<center><div style="width: 400px">![](http://forum.ucoin.io/uploads/default/original/1X/5deea7ee59d908a917eb2f099d44e8ee05e50198.png)</div></center> 
