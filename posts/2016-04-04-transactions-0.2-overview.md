# Un aperçu du protocole 0.2 : les transactions

Une fonctionnalité très importante arrive dans la version 0.2 du protocole. 
Cette fonctionnalité va permettre de réaliser de nombreuses nouvelles choses, de créer des applications 
autour des blockchains ucoin et de s'interfacer avec les crypto-monnaies existantes ! 

Qu'est-ce qui manquait au protocole 0.1 ? Comment est-ce que ces manques ont été corrigés ? Cet article, orienté 
pour les développeurs, devrait intéresser toute personne s'intéressant aux blockchains et aux techniques liées.

## Ce qui manquait au protocole 0.1

Nous avions réalisé le protocole 0.1 avec un objectif très simple. Réaliser une blockchain permettant de tracer l'origine
de la monnaie, pour s'assurer que les abus du type [double-dépense](https://en.wikipedia.org/wiki/Double-spending) soient irréalisables, et que seuls les individus puissent
co-créer de la monnaie.   
Pour ce faire, il a repris le principe initié par [Bitcoin](https://en.wikipedia.org/wiki/Bitcoin) : une blockchain, qui permet, de block en block, de suivre le parcours de la monnaie, d'adresse en adresse. La monnaie est traçable depuis le présent jusqu'à sa création. Nous pouvons vérifier qu'elle a été créée par un membre de la communauté de l'époque, et qu'elle n'a été dépensé qu'une fois à la fois.  
Ce protocole a permis de réaliser très vite des applications simples autour du dividende universel. Chaque individu membre
co-crée de la monnaie, et peut la transférer à une autre adresse.  La forme d'une transaction était la suivante : 
```
ISSUERS: Liste des identifiant des émetteurs signataires de cette transaction
INPUTS: Liste des des transactions sources, dont les signataires doivent être propriétaires
OUTPUTS: Identifiant des destinataires de cette transaction
SIGNATURES
```

Seulement, ce protocole ne permettait pas de réaliser des fonctionnalités avancées très importante autour de la monnaie.  
Pour comprendre, il faut revenir sur un choix réalisé autour du design de notre logiciel monétaire.  

<center>![WoT](https://cloud.githubusercontent.com/assets/1170293/13174860/c1448e88-d706-11e5-8724-5df6b7421bdd.png)</center>

uCoin est un logiciel qui identifie ses utilisateurs grace à [une toile de confiance](https://en.wikipedia.org/wiki/Web_of_trust). Pour que les individus puissent être
identifiés, ils se certifient une confiance d'unicité et d'existence. Cet acte, d'individu en individu, forme
une toile qui permet à tout le monde de savoir qui est reconnu par qui. Cependant, pour que les individus puissent être reconnus, et que les attaques sybilles ne puissent pas arriver, cette toile doit pouvoir être tendue et serrée. Il faut que  des efforts conséquents soit nécessaires pour qu'un tricheur multiplie les identités, de façon à ce que la triche reste un fait mineur.

<center>![Swap exchange](https://framapic.org/uyFv0qtS0yjG/kWXNVu4DAmDg)</center>

La conséquence est que les individus doivent pouvoir créer plusieurs communautés, tester de nouvelles règles de confiance, 
chercher à déterminer les meilleurs paramètres. Tout ces éléments font que plusieurs dizaines de communauté pourront 
potentiellement exister, et devront échanger leur monnaie via des taux de changes inter-communautaires. Ces relations d'échanges doivent pouvoir s'automatiser de façon à ce que ça soit transparent pour les utilisateurs. Aussi, nous souhaitons
éviter au maximum à avoir à introduire des tiers de confiances.

Dans le protocole 0.1, il n'est pas possible d'automatiser cet échange inter-communautaire. 

<center>![Protocol swap exchange with protocol 0.1](https://framapic.org/ohjgASVrm8aU/jdzWNoLWJ8R3)</center>

Vous l'aurez compris : il fallait trouver une solution et améliorer notre blockchain.

## Ne pas réinventer la roue

L'univers de Bitcoin est riche, après 7 années d'expérimentations, leur blockchain a souffert de nombreux défauts. Ils ont eu
à répondre à de nombreuses limitations et ont du créer de nouvelles fonctionnalités régulièrement. Encore aujourd'hui, la communauté Bitcoin continue d'évoluer et de réfléchir aux évolutions à réaliser pour améliorer ce logiciel.  

Dans la blockchain Bitcoin, il est notamment possible de programmer des [transactions scriptées](https://en.bitcoin.it/wiki/Script) dans un langage qui n'est pas turing complet. Ce langage de script permet d'expérimenter et de réaliser toujours de nouvelle fonctionnalités autour de la blockchain de Bitcoin.

L'univers Bitcoin a vu lui aussi naître de [nombreuses crypto-monnaies alternatives](https://coinmarketcap.com/). Souvent, ces forks sont réalisés par des simples changement d'algorithmes de chiffrement, ou d'algorithmes de consensus. Ces monnaies alternatives permettent à leurs utilisateurs de toucher leur part de création monétaire, alors que Bitcoin ne permet plus que de travailler pour les premiers mineurs pour obtenir sa part.  

Pour que les utilisateurs puissant réaliser des places de changes sûres, l'algorithme des transactions crosschains est apparu. Celui ci permet à deux utilisateurs de monnaies distinctes d'échanger entre eux des unités monétaires. Ces unités sont présentes dans des blockchains différentes, et pourtant, l'échange crosschain va permettre de chainer l'échange entre les deux blockchains.

<center>![Protocol 0.2 swap transactions](https://framapic.org/tRYxdRO1UtmH/F83AkN8CdNop)</center>

L'exemple précédent présente le cas idéal, ou Alice et Mark s'échangent leur monnaie sans que le processus soit interrompu. Vous noterez cependant que la monnaie peut ici être bloquée dans la blockchain : Si Mark envoie de la monnaie à Alice, et que Alice ne répond plus, Mark ne peut pas récupérer sa part. C'est pourquoi il est nécessaire d'introduire des documents de remboursements dans cet échange. L'algorithme devient un petit peu plus complexe, alors, accrochez-vous : 

<center>![protocol 0.2 refund](https://framapic.org/pNSVOeTcTzhz/73pbJtiq73RJ)</center>

## Keep It Simple

Développer un langage de script au sein de nos transactions aurait nécessité un effort trop conséquent, alors que nous ne souhaitons par transformer notre blockchain en une blockchain applicative. Nous avons donc décidé de réaliser ce mécanisme transactionnel sous sa forme la plus simple : un conditionnement à l'écriture dans la blockchain.

Comment ça se passe concrêtement ? Les transactions ont toujours une forme *Entrée* -> *Sortie*. Mais des nouveaux éléments font leur apparition : Des *paramètres de déverrouillage* et des *conditions verrouillant* la monnaie de cette transaction.
Dans la pratique, ce changement est simple. La transaction est maintenant de la forme *Entrée* -> *Déverrouillage* -> *Verrou de sortie*. La forme d'une transaction est la suivante : 

```
ISSUERS: Liste des identifiant des émetteurs signataires de cette transaction
INPUTS: Liste des des transactions sources, dont les signataires doivent être propriétaires
UNLOCKS : List des paramètres de déverrouillage des inputs
OUTPUTS: Conditions de verrouillage de la monnaie
SIGNATURES
```

Il existe 2 types de verrous possibles. 
 - Un verrou **SIG(PUBKEY)** qui signifie *La signature de PUBKEY est nécessaire pour utiliser cette monnaie*. 
 - Un second verrou est **XHX(HASH)**, qui signifie *Le nombre X générant le HASH est nécessaire pour utiliser cette monnaie*.

Ces verrous peuvent être combinés par des opérateurs **OR** et **AND**. Enfin, il est possible de placer un verrou temporel **LOCKTIME** sur une transaction. Ce verrou permet d'empêcher d'enregistrer une transaction dans une blockchain avant un temps déterminé.

## Quelques exemples des nouvelles possibilités

Nos transactions simple du protocole 0.1 se transforment sous une nouvelle forme. Pour envoyer de la monnaie à une clé publique **A** nous placerons une condition de déverrouillage **SIG(A)** signifiant *La transaction doit être signée par la clé publique de A pour pouvoir débloquer cette monnaie*.

Pour envoyer de la monnaie à une clé publique **A**, tout en gardant le contrôle sur le moment où elle pourra dépenser cette monnaie, nous utiliserons un verrou **XHX(HASH)** combiné avec un **SIG(A)**. Nous allons choisir un nombre **X**, qui, hashé, génerera le **HASH**. Nous ne donnerons ce nombre **X** à **A** qu'à partir du moment où nous souhaiterons qu'il puisse dépenser sa monnaie, par exemple lorsqu'il aura rempli sa part d'un contrat.  

Nous pouvons envisager aussi de mettre en place des billets *consommables*. Un billet serait verrouillé sur une monnaie dépensable uniquement par un nombre caché dans le billet. La destruction physique du billet révelerait ce nombre et permettrait d'empocher la monnaie sur son adresse. De nombreux moyens physiques de destruction sont possibles, comme par exemple des billets à grater, un révélateur chimique, etc...

Ce ne sont que des premiers idées que nous avons eu en discutant entre nous. Ces nouvelles règles protocolaires vont permettre de développer de nouveaux systèmes toujours plus décentralisés. Reste aux développeurs de s'approprier ces nouveaux moyens pour développer des nouvelles applications pour des individus toujours plus libre !
