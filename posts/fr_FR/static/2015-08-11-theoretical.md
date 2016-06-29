# La théorie

## Un système de crypto-monnaie

Duniter utilise le concept de crypto-monnaie introduit par Bitcoin. Le principe est d'utiliser des fonctionnalités de cryptographie telle que la signature afin de créer des devises numériques. Duniter rentre dans cette définition, mais a des principes totalement différents de Bitcoin comme la toile de confiance et le dividende universel. En fait, uCoin a une référence théorique appelée Théorie Relative de la Monnaie (TRM) que vous trouverez détaillée ici: http://trm.creationmonetaire.info. Cette théorie démontre qu'une monnaie qui vise à respecter les libertés économiques de chaque individu doit mettre en œuvre le Dividende Universel (aka. Revenu de base). Ceci est la seule façon d'éviter les asymétries spatiale et temporelle de l'émission de la monnaie.
## Une asymétrie spatio-temporelle

L'asymétrie spatio-temporelle se réfère à l'accès relatif des individus à la monnaie nouvellement créée. Concrètement, toutes les monnaies existantes (2015) sont à la fois spatialement et temporellement asymétriques pour leurs utilisateurs. Prenons par exemple le Bitcoin afin de comprendre pourquoi.
### Spatialement

Lorsque de nouveaux BTC sont créés, _seuls certains utilisateurs_ (les mineurs) sont crédités, tandis que les autres membres de la communauté ne reçoivent rien. **Nous pensons que ceci est la première injustice.** Cependant, certains pourraient dire :

> <div class="ui message">« Mais les mineurs utilisent de l’électricité et du temps pour obtenir ces BTC! »</div>

À cela, nous répondrions que ce travail _ne doit pas être récompensé par les BTC nouvellement créés_. Les nouveaux BTC devraient être répartis dans toute la communauté. Les mineurs devront être récompensé d’une autre façon. Bien sûr, Bitcoin ne peut pas créer de la monnaie grâce au revenu de base puisque les utilisateurs ne sont pas fortement identifiés. En possédant plusieurs portefeuilles, ils pourraient bénéficier plusieurs fois de la création de monnaie. uCoin se débarrasse de ce problème dans sa conception par l'identification de ses utilisateurs, ce qui permet de donner _le même montant à tout le monde_.
### Temporellement

Bitcoin a une limite prévue de 21 millions de BTC. Cela signifie que de moins en moins de monnaie est créée au fil du temps (jusqu'à plus du tout). Ainsi, une fois que les premiers arrivants auront exploité chaque BTC, comment feront les suivants pour obtenir des BTC ? La réponse est: tout comme pour les euros ou les dollars. Pour obtenir de la monnaie, vous devrez forcément travailler pour ceux qui en possèdent déjà, ce qui ne permet pas de commencer son activité économique librement. **Nous pensons que c’est la seconde injustice.** Chaque membre d'une communauté monétaire devrait être égal face à l'émission de la monnaie et en obtenir la même quantité relative au cours du temps, _même s'il adopte le système en cours de route_. uCoin tend à corriger ce défaut en faisant croître le Dividende Universel en fonction du temps selon des règles précises permettant aux membres d’obtenir une quantité égale de monnaie sur la période d’une demie vie.
## Une solution

L’idée est la suivante: Bitcoin nous a enseigné _qu'il est possible_ de créer un système monétaire permettant à la fois de créer la monnaie numérique et de l'échanger sans autorité centrale. Qu'est-ce que nous devons changer _à la façon dont la monnaie est créée_ afin que nous ayons enfin un système symétrique ? Nous avons besoin de Bitcoin + le Dividende Universel. Mais le dividende universel _implique_ d'avoir une communauté de personnes identifiées. C’est ici qu’intervient la toile de confiance (Web of Trust = WoT). Ce concept, introduit par la cryptographie avec le format OpenPGP, nous permet d'identifier les membres d'une manière décentralisée. Il fonctionne de cette façon: chacun crée une _identité personnelle_, liée à son certificat cryptographique, qui doit être confirmée par les autres membres en utilisant leur propre clé de chiffrement. C’est aussi simple que cela : **les gens définissent par eux-mêmes, qui fait et qui ne fait pas partie de la communauté.**

> uCoin n'utilisera cependant pas OpenPGP pour ses fonctions cryptographiques mais plutôt les Courbes Elliptiques du fait de la concision des clés générées et les avantages pratiques qu'il en résulte. Cela implique pour nous de définir notre propre processus de génération de toile de confiance, mais nous pensons que cela en vaut la peine.
### La Blockchain

Le mécanisme de blockchain de Bitcoin est important pour nous, pour deux raisons principales: **la synchronisation et la sécurité**. uCoin l’utilisera aussi pour bénéficier de ces deux caractéristiques. Cependant, la blockchain de uCoin est légèrement différente : non seulement elle stocke les transactions, mais aussi _les variations de la communauté_ pour définir la toile de confiance. Elle dispose également d'un mécanisme différent de _preuve de travail_ (Proof-of-Work = PoW) rendu possible par définition de la WoT, offrant un rendement énergétique moyen vraiment meilleur pour calculer la blockchain.
#### La toile de confiance (WoT)

La toile de confiance (ou Web-Of-Trust) doit être écrite dans notre document commun : la blockchain. De la même manière que les transactions de Bitcoin sont écrites dans la blockchain de Bitcoin, l'identité de chaque personne est également inscrite. Ainsi, la blockchain constitue un _référentiel d'espace-temps_, où _l'espace_ est représenté par les individus et _le temps_ fourni par les unités de la blockchain : les blocs. Ce que nous avons au final est la **WoT(t)** : la communauté à un instant t.
#### Les transactions

La blockchain est aussi le lieu où les _transactions_, le support de la monnaie, sont stockées séquentiellement et permettent de définir la propriété de la monnaie. Pour cette partie, uCoin ressemble vraiment à Bitcoin : les transactions sont les intrants (les sources) et génèrent des sorties. La transaction est un flux de monnaie. Cependant, dans uCoin les entrées peuvent être :

*   la monnaie d'une autre transaction [comme Bitcoin]
*   la monnaie d'un Dividende Universel [spécifique à uCoin]

Comme vous pouvez le voir, aucune _transaction de génération_ n'existe dans uCoin. Ce type d'opération est remplacé par le _dividende universel_. Les sorties, de leur côté, sont toujours des clés publiques, et pas nécessairement des clés publiques de membres : _les entreprises_ peuvent aussi avoir une clé publique. Cela nous conduit à un fait important: **les entreprises sont également en mesure d'utiliser la monnaie**.

Notez soigneusement que, même si elles peuvent participer, **les entreprises ne peuvent pas créer de la monnaie**. Seules les personnes seront en mesure de le faire. Ceci est un point très important.
#### La preuve de travail

Comme tout système de crypto-monnaie P2P, uCoin a une façon de synchroniser ses pairs pour la rédaction de son document commun (la blockchain). Cependant, uCoin bénéficiant d'un environnement très différent de celui d'autres altcoins : **une toile de confiance identifiée**. Cette petite différence a un impact énorme : alors que Bitcoin doit faire un **challenge global** à l'aide de ressources CPU pour éviter le détournement de la blockchain par quelques personnes, uCoin a la possibilité de compter sur ses membres afin d'écrire la blockchain : cela nous permet à la fois d'éviter le problème du gaspillage d'énergie introduit par la preuve de travail et facilement balayer l'attaque de 51 dans uCoin. Concrètement, uCoin a un **challenge personnalisé** pour chacun de ses membres qui est de plus en plus difficile pour le membre qui réussit l'écriture d'un bloc, alors qu'il devient plus facile - jusqu'à un plancher donné - pour les autres. Ce mécanisme assure une rotation dans l'écriture de la blockchain, tout en gardant l'avantage de la preuve de travail pour synchroniser les pairs.

> On peut enfin noter que, comme calculer un bloc n'est pas récompensé par la création de monnaie supplémentaire, les membres ne seront pas poussés dans la concurrence pour l'écriture du bloc suivant.
### Pour résumer

La blockchain de uCoin peut être comparé à la blockchain de Bitcoin : un grand livre retraçant l'histoire de chaque adhésion à l'intérieur de la Communauté, ainsi que les opérations de ses utilisateurs. Avec la blockchain, nous avons le **référentiel fondamental** de la [Théorie Relative de la Monnaie](http://trm.creationmonetaire.info) (les humains) et le flux des transactions émises par les utilisateurs de la monnaie.
## Une économie libre

Le but de tout cela est de permettre aux gens de participer à une économie libre grâce à une monnaie libre. Qu'est-ce qu'une économie libre ? La [Théorie Relative de la Monnaie](http://trm.creationmonetaire.info/) la définit à travers 4 libertés économiques :

*   **La liberté de choisir son système monétaire** : parce que la monnaie     ne devrait pas être imposée
*   **La liberté d'accès aux ressources** : parce que nous devrions tous     avoir accès aux ressources économiques et monétaires
*   **La liberté d'estimer et de produire de la valeur** : parce que la     valeur est une notion relative à chaque individu, dans l'espace et le     temps
*   **La liberté d'échanger dans la monnaie** : parce que nous ne devrions     pas être limités par le stock de monnaie disponible

Ces quatre libertés économiques doivent être comprises ensemble, pas exclusivement. De plus, la «_liberté_» doit être comprise comme «_non-nuisance_». Donc ici, la liberté ne signifie pas le droit de prendre toutes les ressources (comme une source d'eau dans un désert) et qu'il n'y en ai plus à la disposition des autres. Maintenant vous comprenez quel est l'objectif : une _économie libre_ à travers des _monnaies libres_.

