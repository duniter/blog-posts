# Introduction à la gestion des membres

Duniter est un logiciel permettant de créer une monnaie libre au sens décrit dans la TRM (Théorie Relative de la Monnaie).
Cette théorie implique que les unités monétaires sont co-produites par chacun des membres d'une même communauté.
Il est donc essentiel que les membres de la communauté soient bien identifiés et (re)connus.

Dans un monde dépourvu de gens malhonnêtes, une simple déclaration d'identité pourrait suffire pour devenir membre (et donc co-produire des unités monétaires).
Mais dans notre monde, s'agissant de monnaie, des cas de triches sont susceptibles d’apparaître.

En effet, il est tentant de s'inscrire avec plusieurs identités et ainsi produire un surplus d'unités monétaires à son avantage.
Ceci est d'autant plus vrai qu'il s'agit d'identités numériques et qu'il est aisé d'en créer autant que l'on en souhaite.
On appelle cela une *« attaque sybil »*.

Il convient donc de s'assurer que les membres ne disposent que d'une seule identité numérique.


## À qui faire confiance ?

Comment s'assurer que les membres ne disposent que d'une seule identité numérique ?
Quelle organisation est nécessaire ?

Il existe deux types d'organisations possibles : les organisations à tiers de confiance et les organisations auto-régulées.

Pour illustrer l'organisation à tiers de confiance, prenons l'exemple du recensement de la population.
Ce sont les services de l'état qui « créent » les identités et les enregistrent dans les différents fichiers (aka. bases de données) de l'état. Les fonctionnaires agissent comme « tiers de confiance » au nom de l'état. Les moyens de contrôles utilisés peuvent être des justificatifs administratifs (déclaration de la maternité, justificatifs de domicile, …). Ces moyens sont loin d'être infaillibles puisqu'il est trivial de créer des faux documents (et ainsi obtenir de vrais-faux papiers). 
Ce système s'appuie donc sur le système judiciaire pour dissuader les comportements frauduleux.

Pour illustrer une organisation auto-régulée, nous pouvons utiliser l'exemple de la file d'attente.
Les personnes arrivent les unes après les autres et, bien que personne ne soit vraiment ravi d'avoir à attendre son tour,
 chacun respecte la règle, qui régit une file d'attente ; l'ordre de passage correspond à l'ordre d'arrivée.
Étant donné que chacun sait qui est arrivé avant et qui est arrivé après, chacun est en mesure de contrôler qu'il n'y a pas de fraude.
Enfreindre ces règles nous expose à une désapprobation sociale forte, et une exclusion de la file d'attente.


## La toile de confiance

Duniter fait le choix d'un système auto-régulé par ses membres. 

Rappelons l'objectif qui est de s'assurer que les individus ne puissent s'enregistrer qu'avec une seule identité numérique.

Le système distingue deux types d'identités numériques : les *identités membres* et les *identités non-membres*. 
Seules les identités membres sont co-créatrices de monnaie.

Chaque individu déjà membre est en capacité, à l'aide d'un document numérique signé, de certifier des identités (membres et non membres).
Cela revient à délivrer des **certificats d'authenticité**.

Ces certificats, donnés les uns aux autres, forment un maillage appelé « **toile de confiance** ». 
Cette toile de confiance est utilisé par Duniter pour déterminer qui est membre et qui ne l'est pas.


<center>![Toile de confiance globale de la monnaie de test Méta Brouzouf en juin 2015](https://moul.re/blog/data/medias/ucoin/wot_fmm5.png)</center>


## Les règles de fonctionnement de la toile de confiance

Les règles régissant la toile de confiance d'une monnaie Duniter est paramétrée lors de la création (l'initialisation) de cette monnaie, par ses fondateurs, et *ne peuvent pas être modifiés ultérieurement*.
Il est donc important d'y porter une attention particulière.


**L'auto-déclaration d'identité numérique**

Un individu, s'il souhaite devenir membre d'une communauté, doit créer son identité numérique.

Sur Duniter, une identité numérique est composée de :

 - une clé cryptographique privée, connue uniquement de l'individu et donc non diffusée sur le réseau, lui servant à signer des documents numériques
 - une clé cryptographique publique, connue de tous, permettant de vérifier qu'un document a été signé par la clé privée de l'individu
 - un pseudonyme 

L'auto-déclaration d'identité à elle seule ne suffit pas pour devenir membre mais est la première étape du processus.

Tout comme une carte d'identité, une identité numérique a une **durée de validité**.
Si elle n'est pas renouvelée régulièrement, elle devient invalide.

Dans une monnaie créée par Duniter, la durée maximale de validité d'une identité membre est configurée avec le paramètre *msValidity (Membership expiry Delay)*

**Les certifications**




Pour devenir membre, un individu doit collecter un certain nombre de certifications de la part de membres déjà existants.
Ces certifications ont une durée de validité. Pour conserver un statut membre, une identité numérique doit donc être continuellement re-certifiée par des individus membres.

Le nombre de certifications nécessaires pour devenir membre est configuré avec le paramètre *sigQty (Min Required Certs)*.
La durée de vie d'une certification est configurée avec le paramètre *sigValidity (Cert Expiry Delay)*.

**Les protections anti-Sybil**

Des règles complémentaires sont mises en place pour assurer la sécurité de la toile de confiance contre un groupe d'attaquants.

 - Le nombre de pas

Un groupe d'individus membres pourrait s'entendre pour créer des identités fictives et les certifier pour leur permettre de devenir membres à leurs tour.
Plus encore, ils pourraient utiliser ces membres fictifs pour certifier de nouvelles identités fictives, créant ainsi un très grand nombre de membres illégitimes.

<center>![Réseau Sybil](https://framapic.org/qh2PZc9A2Unk/IDZe8MfG6yh0.jpg)</center>


Pour prévenir cette attaque, Duniter s'assure que les membres soient suffisamment proches les uns des autres dans la toile de confiance.
Dans l'exemple ci-dessous, le membre C est à deux pas (deux sauts) de A.

<center>![Nombre de pas à 2](https://framapic.org/4LNI8XX2JAJt/HY1s3QndhJS7.jpg)</center>


Lorsqu'un individu est susceptible de devenir membre (c'est-à-dire qu'il a obtenu suffisamment de certifications), Duniter déroule le protocole de vérification suivant :
    
 - Les membres ayant émis suffisamment de certifications sont utilisés comme « points de contrôle » (*sentries*).

Le nombre de certifications émises requises dépend du nombre de membres en cours.
N est le nombre de membres, Y(N) est le nombre de certifications émises requises pour que le membre soit considéré « point de contrôle ».

	N         Y(N)
	10        2
	100       4
	1000      6
	10000     8
	100000    12
	1000000   20

Pour devenir membre, l'identité doit pouvoir joindre un certain pourcentage *xpercent* (Percent of distance) des points de contrôle avec un nombre de pas maximum nommé *maxsteps* (Max distance).


**Limiter les pouvoirs**

Afin de se protéger contre une création de membres sybils massive, les membres sont dotés d'un stock limite de signature.
Ce stock se vide à mesure que le membre émet des certifications, et se remplit à mesure que ces certifications expirent.

Le stock de certifications est configuré avec le paramètre *sigstock* (Max cert stock).

De plus, afin d'enrayer une éventuelle attaque, Duniter ne permet pas qu'un membre puisse émettre plusieurs certifications simultanément.
Duniter les traite les unes après les autres en observant une pause entre chaque traitement.

Ce période est configurée avec le paramètre *sigPeriod* (Delay between two certs).


**L'expiration des certifications en cours de traitement**

Une certification qui n'a pas été traitée dans un certain laps de temps est détruite.
Cela se produit lorsque qu'un membre émet de nombreuses signatures au même moment.
Duniter observant une pause entre chaque traitement, les certifications qui n'ont pas eu le temps d’être traitées sont détruites.

Ce laps de temps est configurable avec le paramètre *sigWindow* (Cert Time Window).

Il existe un paramètre similaire utilisé lors de l'inscription de nouveaux membres.

Comme vu précédemment, pour devenir membre un individu doit :

 - publier sa déclaration d'identité
 - collecter un nombre de certifications suffisantes
 - respecter la règle des pas

Ces trois étapes doivent être réalisées dans le laps de temps configuré par *idtyWindow*.

