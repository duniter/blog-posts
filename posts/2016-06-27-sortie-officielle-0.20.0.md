# Sortie officielle de Duniter 0.20.0

Maintenant que les [RML 7 sont terminées](https://fr.duniter.org/rml7-liens-et-videos/), nous pouvons de nouveau nous concentrer sur l'évolution des logiciels de l'écosystème Duniter.

Et aujourd'hui est une date importante, car nous officialisons la livraison de **Duniter dans sa version 0.20.0** !

Quelle est donc cette version, et quelle sera la suite ?

> Si vous souhaitez utiliser cette nouvelle version sans plus attendre : suivez ce [tutoriel d'installation de Duniter (anglais)](https://forum.duniter.org/t/install-a-duniter-node/900)

## TestNet et le protocole en version 0.2

Cela fait maintenant 2 mois que la nouvelle monnaie de test appelée « *TestNet* » circule sur le réseau. Elle compte aujourd'hui 81 membres se partageant et s'échangeant les 810 dividendes qui constituent la monnaie, via les logiciels de paiement libres que sont [Cesium](http://cesium.duniter.fr), [Sakia](http://sakia-wallet.org/) et [Android](https://play.google.com/store/apps/details?id=org.duniter.android&hl=fr).

Cette monnaie est sous-tendue par le logiciel Duniter dans sa **version 0.20.0**, qui malgré l'annonce dans le présent billet, existe en réalité depuis plusieurs semaines : mais c'est aujourd'hui que nous l'officialisons.

<center>

![](https://forum.duniter.org/uploads/default/original/1X/67a7b7f99a77471a5bae96a467fb9ffa806205ba.png)

*Duniter est désormais en version 0.20.0*

</center>

Cette version du protocole est actuellement stable, de même que cette version du logiciel. Cela fait pratiquement 1 mois que nous autres, développeurs ou utilisateurs avancés du logiciel, ne sommes pas intervenus pour palier à un bug majeur ou a une instabilité.

Dans les faits bien sûr, des forks apparaissent régulièrement : c'est-à-dire que le réseau se scinde en 2 groupes qui ne sont plus d'accords entre eux pour diverses raisons (latences réseau, bloc calculé simultanément, etc.). Mais cette scission ne dure jamais très longtemps, en général une heure, chaque pair disposant de mécanismes automatiques afin de rejoindre le consensus dès lors que celui-ci émerge. L'expérience de ce derniers mois nous montre que ces mécanismes sont tout à fait fonctionnels et à l'épreuve des aléas de connectivité réseau !

Et donc grâce à cette version 0.20.0 de Duniter, le logiciel fonctionne, se montre stable, et le réseau d'utilisateurs fait sa vie, [se reconnaît mutuellement](https://forum.duniter.org/search?q=Demande%20de%20certification) et produit sa monnaie. D'aucuns se demandent même pourquoi ne pas lancer tout de suite une monnaie libre ! C'est dire l'impression procurée par son l'utilisation !

Même si nous devons tempérer ces ardeurs, puisqu'il nous reste du travail comme vous le verrez ci-après, ces derniers résultats sont tout de même très positifs !

<center>

![](https://forum.duniter.org/uploads/default/original/1X/f746ce865f86bcecc583ab5be3b779c13c967c42.png) 

*Le réseau de pairs Duniter pour la monnaie TestNet*

</center>

## Vers les protocoles 0.3 et 0.4 !

Cette stabilité et les désormais nombreux utilisateurs de la monnaie (81 utilisateurs venus de tous horizons) nous donnent des ailes : nous préparons ainsi plusieurs évolutions importantes en vue de réaliser une première monnaie libre, et qui passeront par 2 évolutions successives du protocole,  *a minima*.

### La version 0.3

Cette version du protocole sera rétro-compatible avec la version 0.2. C'est-à-dire qu'il ne sera pas nécessaire de démarrer une nouvelle monnaie pour l'utiliser.

Les changements apportés par cette version sont uniquement techniques&nbsp;: 

* Apporter des limites explicites pour *tous les champs variables*, comme le nombre de transactions possibles au sein d'un bloc (évite une attaque par submersion)
* Faire disparaître le paramètre `blocksRot` (correctif [#441](https://github.com/duniter/duniter/issues/441))
* Empêcher la métastase des sources de sortie d'une transaction (correctif [#485](https://github.com/duniter/duniter/issues/485))
* Nécessiter un verrou pour consommer un montant de transaction (correctif [#379](https://github.com/duniter/duniter/issues/379))
* Introduire la rétro-compatibilité protocolaire (gérer le passe de la version 0.2 à 0.3 du protocole, et généraliser cela pour une version `n` à `n+1`)

Ces changements sont énumérés ici afin notamment que les développeurs de clients comme Cesium, Sakia ou l'application Android puissent anticiper ces changements et proposer aux utilisateurs des versions compatibles au moment du déploiement sur le réseau.

### La version 0.4

Il s'agira d'une version majeure impactant directement les règles de la toile de confiance. En effet, nous étudions actuellement plus en profondeur les règles à implémenter pour espérer atteindre, un jour, le million d'utilisateurs pour une monnaie réalisée via Duniter.

Et cela demande de ne pas faire n'importe quoi, au risque d'aller droit dans le mur. Non seulement les règles doivent être claires et efficaces, mais les valeurs des paramètres doivent être correctement choisis. Il s'agira de la dernière étape de nos développements dans la réalisation possible d'une monnaie libre P2P.

Cette version impactera aussi les logiciels clients, comme pour la version 0.3 du protocole, mais cette fois-ci au niveau des certifications. Cela ne devrait toutefois pas chambouler les pratiques (développeurs, rassurez-vous).

<center>

[![](https://forum.duniter.org/uploads/default/original/1X/7f5c8cc2565800c5d825a8c05df40440e9a546d3.png)](http://cesium.duniter.fr)

*Logo de l'application Cesium, application web cliente pour Duniter*

</center>

## Du chemin à parcourir

Comme vous le voyez, il nous reste encore du chemin avant d'en arriver à nos fins ! Et peut-être attendez-vous vous aussi, avec impatience, l'émergence d'une monnaie libre P2P ?

Mais plutôt que d'attendre, vous pouvez aussi [nous aider](http://fr.duniter.org/contribute) à votre échelle afin d'accélérer les choses ! [Venez nous voir](http://fr.duniter.org/contact/) sur les [salons de discussion](https://jappix.com/?r=duniter@muc.duniter.org) (choisissez un pseudo) et [forum](https://forum.duniter.org), nous vous répondrons !

Car une monnaie libre n'émergera pas toute seule, et même une fois réalisée, c'est bien *vous* qui produirez votre monnaie : ce n'est pas un banquier qui le fera à votre place !

Alors si vous comptez utiliser une monnaie libre, autant s'y mettre dès maintenant ! [Venez tester](http://fr.duniter.org/try/), venez développer, en deux mots : *venez participer* !
