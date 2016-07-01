# Présentation

Duniter est un logiciel de _crypto-monnaie_, c'est-à-dire qu'il s'agit d'un **logiciel** permettant de **créer des monnaies**. Duniter est différent des autres logiciels de crypto-monnaie que vous connaissez peut-être (Bitcoin, Litecoin, Peercoin, ...) pour 2 raisons principales : son **code monétaire** qui inclut à la fois les concepts de [Dividende Universel](https://fr.wikipedia.org/wiki/Cr%C3%A9dit_social) et de [Toile de Confiance](https://fr.wikipedia.org/wiki/Toile_de_confiance), mais aussi son **code de Blockchain** qui est bien moins énergivore, solutionnant l'énorme gâchis d'énergie électrique introduit par Bitcoin.
## Les grandes lignes

> **Tout membre est co-producteur de la monnaie** sans rien faire, juste pour être un humain de la Communauté monétaire.

C'est de là que vient la monnaie : chaque membre produit régulièrement un Dividende Universel, c'est-à-dire la part de nouvelle monnaie qui lui revient de droit. Il ne s'agit pas de monnaie prise à autrui, mais bien de création pour soi.

> **Tout membre a besoin de signatures provenant d'autres membres** afin de rejoindre ou simplement rester dans la Communauté monétaire.

Chaque membre est *fortement identifié* à travers un mécanisme de « toile de confiance » pour éviter de recevoir de multiples dividendes universels grâce à de multiples identités. Cela implique une reconnaissance régulière et renouvelée de l’identité de chacun.

> **Les données sont entièrement distribuées par le réseau de P2P** pour éviter toute centralisation très sujette à corruption ou point de défaillance unique.

Les données sont entièrement gérées par le *réseau P2P*, ainsi la monnaie ne tombe pas sous le contrôle de quelques mains et peut rester une monnaie libre.
## Plus de détails

### La monnaie est co-produite par tous les membres de la Communauté

C'est réellement la fonction principale : la monnaie est co-produite *de manière égale* par les membres de la communauté (aussi connue sous le nom de Toile de Confiance (TdC)). Une telle égalité est assurée à la fois dans l'espace et dans le temps de manière à ce que les nouveaux venus ne soient pas exclus du processus de production de la monnaie [comme on peut malheureusement l'observer avec Bitcoin](http://magazine.ouishare.net/fr/2013/07/game-over-bitcoin-monnaie-virtuelle/), et donc **il ne sera pas nécessaire de créer un énième cousin de Bitcoin pour bénéficier de votre part de nouvelle monnaie**. Cette co-production implique toutefois que les membres soient identifiés dans le logiciel, et donc un mécanisme pour empêcher les individus de créer plusieurs comptes afin de produire plus de monnaie que les autres.
### La fin d'une course au processeur : une Blockchain efficace énergétiquement

Les blockchains classiques utilisent la puissance CPU pour résoudre des problèmes de sécurité. Même si cela fonctionne (en tout cas, il semble que oui), c'est un processus coûtant très cher d'un point de vue énergétique. Duniter parie qu'il est possible d'avoir un processus similaire mais *bien plus efficace* énergétiquement, qui ne soit pas non plus le petit frère de la Preuve de Travail aussi nommé "Preuve de possession" (le pouvoir par les riches). Duniter bénéficie d'une ressource particulière pour atteindre ce but : chaque bloc est calculé exclusivement par les membres. Cela signifie que ni super-Google ni aucun groupe au supers pouvoirs ne serait capable de prendre le contrôle de la blockchain. De plus, Duniter ajoute un règle de rotation afin qu'**un membre seul ne puisse pas prendre le contrôle non plus**. Un groupe d'utilisateurs le pourrait, mais cela impliquerait que leur puissance de calcul serait plus élevée que le reste de la communauté de membres connectée au réseau. C'est ici qu'intervient la Toile de Confiance : chaque membre est reconnu (nous avons confiance en son identité, pas spécialement ses actes) s'il remplit les règles de la TdC :

*   les membres doivent avoir assez de signatures (liens) des autres membres
*   le membre doit être assez proche de chaque autre membre

sachant que :

*   les signatures expirent (elles ont une durée de validité)
*   un lien donné doit observer un délai avant de pouvoir être rejoué
*   un membre doit observer un délai entre chaque signature qu'il effectue     (ex. : une semaine)
*   un membre a une limite dans le nombre de liens qu'il peut faire vers les     autres
*   les liens ne peuvent pas être écrits dans le futur
*   les liens ne peuvent pas être écrits trop loin dans le passé

Ces règles sont ce qui permet raisonnablement de s'assurer que la grande majorité de la Toile de Confiance soit composée d'individus vivants et uniques. Selon les paramètres de la monnaie, ces règles peuvent devenir aussi bien faciles que très difficiles à passer. Par exemple, si chaque membre doit être directement signé par chaque autre membre (distance = 1), alors il ne sera pas possible d'avoir de faux comptes (à moins que chacun soit d'accord avec cela). Mais une telle communauté sera forcément très réduite. A l'opposé, une distance de 5 signifierait qu'il existe un chemin de 5 liens entre toute paire de membre (de l'un vers l'autre). Cela serait une communauté plus grande et bien plus facile à réaliser, mais les faux comptes le seraient également. C'est là toute la difficulté de choisir les bons paramètres pour une taille maximale de communauté.
## Plus de détails ?

Pour aller plus loin dans les concepts de Duniter, faites un tour du coté de la [Théorie](http://duniter.org/theoretical/).

