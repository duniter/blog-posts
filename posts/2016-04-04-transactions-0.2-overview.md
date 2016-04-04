# Un aperçu du protocol 0.2 : les transactions

Grâce au travail de @cgeek, une fonctionnalité très importante arrive dans la version 0.2 du protocole. 
Cette fonctionnalité va permettre de réaliser de nombreuses nouvelles choses, de créer des applications 
autour des blockchains ucoin et de s'interfacer avec les crypto-monnaies existantes ! 

Qu'est-ce qui manquait au protocole 0.1 ? Comment est-ce que ces manques ont été corrigés ? Cet article, orienté 
pour les développeurs, devrait intéresser toute personne s'intéressant aux blockchains et aux techniques liées.

## Ce qui manquait au protocole 0.1

@cgeek avait réalisé le protocole 0.1 avec un objectif très simple. Réaliser une blockchain permettnat de tracer l'origine
de la monnaie, pour s'assurer que les abus du type "double-dépense" soient irréalisables, et que seuls les individus puissent
co-créer de la monnaie.   
Pour ce faire, il a repris le principe initié par Bitcoin : une blockchain, qui permet, de block en block, de suivre le parcours
de la monnaie, d'adresse en adresse. La monnaie est traçable depuis le présent jusqu'à sa création. Nous pouvons vérifier
qu'elle a été créée par un membre de la communauté de l'époque, et qu'elle n'a été dépensé qu'une fois à la fois.  
Ce protocole a permis de réaliser très vites des applications simples autour du dividende universel. Chaque individu membre
co-crée de la monnaie, et peut la transférer à une autre adresse.  
Seulement, ce protocole ne permettait pas de réaliser des fonctionnalités avancées très importante autour de la monnaie.  
Pour comprendre, il faut revenir sur un choix réalisé autour du design de notre logiciel monétaire.  

uCoin est un logiciel qui identifie ses utilisateurs grace à un toile de confiance. Pour que les individus puissent être
identifiés, ils se certifient une confiance d'unicité et d'existence. Cet acte, d'individu en individu, forme
une toile qui permet à tout le monde de savoir qui est reconnu par qui. Cependant, pour que les individus puissent être reconnus,
et que les attaques sybilles ne puissent pas arriver, cette toile doit pouvoir être tendue et serrée. Il faut que ça demande des
efforts conséquents à un tricheur de multiplier les identités, de façon à ce que la triche reste un élement minoritaire.

La conséquence est que les individus doivent pouvoir créer plusieurs communautés, tester de nouvelles règles de confiance, 
chercher à déterminer les meilleurs paramètres. Tout ces éléments font que plusieurs dizaines de communauté pourront 
potentiellement exister, et devront échanger leur monnaie via des taux de changes inter-communautaires. Ces relations d'échanges
doivent pouvoir s'automatiser de façon à ce que ça soit transparent pour les utilisateurs.

Dans le protocole 0.1, il n'est pas possible d'automatiser cet échange inter-communautaire. 

**TODO : Schématiser un échange inter-communauté en 0.1 et montrer le problème**

Vous l'aurez compris : il fallait trouver une solution et améliorer notre blockchain.

## Ne jamais réinventer la roue


## Keep It Simple

## Quelques exemples des nouvelles possibilités
