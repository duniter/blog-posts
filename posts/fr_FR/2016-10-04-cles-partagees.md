# Avoir plusieurs pairs partageant une même clé

Petit billet technique, vu que Moul m'inspire le sujet dans [ce ticket](https://github.com/duniter/duniter/issues/608).

> Attention, ce billet est de la technique pure et dure d'un protocole encore peu connu, ce post est donc pour les plus acharnés.

## Avoir plusieurs nœuds partageant un même trousseau

Peut-être ne le savez-vous pas encore, mais il est *tout à fait possible d'avoir plusieurs nœuds à soi qui calculent de concert* le prochain bloc que vous seriez en mesure de calculer.

En effet, vous avez simplement à inscrire les données de votre trousseau personnel dans l'écran dédié de chacun de vos nœuds pour réaliser cette opération :

<img src="/uploads/default/original/2X/8/81af8fb7a40fb8278968dfc6c8bb98b8549e1618.png" width="690" height="393">

### Quel intérêt ?

Avoir plusieurs nœuds avec votre trousseau personnel est strictement équivalent à avoir une puissance de calcul répartie sur chacun de vos nœuds. Plus vous avez de nœuds physiques différents, plus vous avez de puissance de calcul et êtes susceptibles de trouver le prochain bloc.

L'intérêt est à la fois de **sécuriser davantage le réseau** en élevant la difficulté commune de la preuve de travail, mais cela vous donne aussi **un avantage concurrentiel pour trouver la prochaine preuve**, et par conséquent recevoir davantage de récompense de services comme [Remuniter](http://remuniter.cgeek.fr). Ou encore, au cas où l'un de vos nœuds tombe, il y en a toujours d'autres pour calculer : c'est une sécurité supplémentaire.

### Déclarer ses nœuds

Les développeurs de clients tels Sakia/Cesium/Silkaj, mais également les participants des RML6 savent que chaque pair du réseau, chaque nœud, est identifié par sa clé publique et une liste d'interfaces techniques.

Une fiche de pair ressemble à ceci (vous pouvez obtenir ce document dans Sakia en faisant un clic droit sur un nœud du réseau puis « Ouvrir dans le navigateur ») :

```
Version: 2
Type: Peer
Currency: test_net
PublicKey: HnFcSms8jzwngtVomTTnzudZx7SHUQY8sVE1y8yBmULk
Block: 43835-00000D9316C6A4A1C236A0A3CA58FC007B75829981DA08A0633AA622E26F2421
Endpoints:
BASIC_MERKLED_API cgeek.fr 88.174.120.187 2a01:e35:8ae7:8bb0:b468:a0c:a607:379f 9330
BASIC_MERKLED_API 88.174.120.187 9333
SJZe1JvGgWYibkiApJIiwLVbfB8LIuq4oPB+ejqnXNM5NqFdz9p1C5mXIpAA62c4f1JXIUQf5RhcvQdMMGGiAg==
```

On peut y voir la clé publique qui rassemble les entités techniques, ici :

```
PublicKey: HnFcSms8jzwngtVomTTnzudZx7SHUQY8sVE1y8yBmULk
```

Puis la liste de ces entités ou nœuds :

```
BASIC_MERKLED_API cgeek.fr 88.174.120.187 2a01:e35:8ae7:8bb0:b468:a0c:a607:379f 9330
BASIC_MERKLED_API 88.174.120.187 9333
```

Nous pouvons traduire ces 2 lignes en :

```
Il existe une interface BASIC_MERKLED_API disponible sur cgeek.fr [blabla …] port 9330
Il existe une interface BASIC_MERKLED_API disponible sur 88.174.120.187 port 9333
```

Et donc, pour chaque nœud, une entrée est ajoutée ici.

### Le blockstamp

Mais il existe aussi un champ très important, présent dans ce document mais également dans **tout document Duniter**, ce que je nomme le *blockstamp* (mot-valise de *blocktime* et *timestamp*) :

```
Block: 43835-00000D9316C6A4A1C236A0A3CA58FC007B75829981DA08A0633AA622E26F2421
```

Ce champ est une date. Une date qui désigne un bloc précis de la chaîne de blocs : elle est composée d'un premier nombre qui représente un n° de bloc, puis un condensat ou *hash* de bloc qui est le condensat de ce même bloc. Étant donné que la chaîne de bloc est un historique représenté par des blocs, alors référer à l'un d'eux est exactement comme donner une date.

Celle-ci est toutefois très particulière car l'une de ses propriétés est *de ne pas être connue par avance* : en effet, son condensat est justement ce que les nœuds du réseau cherchent à calculer à chaque itération, chaque instant de la chaîne de blocs, *et affecte directement le condensat suivant*.

> En effet, on parle de *chaîne de blocs* justement car chaque bloc inscrit le condensat du précédent bloc dans son propre corps de document, qui est lui-même la source du condensat à trouver.

Et cela est extrêmement intéressant : en demandant d'inscrire cette date dans les documents Duniter, on s'assure que ce document *n'a pas pu être produit avant la date inscrite sur le bloc*. En effet, répétons-le, le condensat n'est pas connu par avance. Donc, nous disposons là d'un puissant moyen de datation.

### Le stock de blockstamp

Et alors, quel est le lien avec nos nœuds ? Afin de se faire connaître du réseau, chaque nœud construit la fiche de pair que nous avons vu plus haut : celle-ci contient initialement **uniquement l'interface du nœud local**, qui se connaît bien évidemment lui-même, *mais n'a aucune idée du fait que vous pouvez posséder plusieurs nœuds comme lui*.

Si l'on reprend ce scénario pour chaque nœud qui partage le même trousseau, alors nous avons un ensemble de nœuds qui vont se disputer la fiche de pair : en effet, imaginons être en possession de deux nœuds partageant un même trousseau, alors nous avons par exemple :

* le nœud Na qui envoie sa fiche de pair Fa1, à la date D1 et sa clé publique P, avec l'interface de Na :

```
[Fiche partielle Fa1]
PublicKey: P
Block: D1
Endpoints:
Na
```

* le nœud Nb qui envoie sa fiche de pair Fb1, à la date D1 et sa clé publique P, avec l'interface de Nb :

```
[Fiche partielle Fb1]
PublicKey: P
Block: D1
Endpoints:
Nb
```

Les autres nœuds du réseau qui reçoivent les fiches Fa1 et Fb1, avec une même clé publique et une même date, n'ont du coup *aucun moyen de discrimination* pour choisir l'une ou l'autre de ces fiches comme étant légitime.

Dès lors, un scénario possible est que Na, voyant la fiche Fb1 manifestement fausse s'il l'avait émise lui-même (il aurait émis Fa1, précisément), alors il incrémente la date et émet une nouvelle fiche Fa2, avec pour date D2 donc :

```
[Fiche partielle Fa2]
PublicKey: P
Block: D2
Endpoints:
Na
```

Pour les autres nœuds du réseau, il y a là un discriminant : la fiche Fa2 est plus récente que Fb1, *car D2 est plus grand que D1*.

Le réseau accepte donc Fa2, puis Nb voyant Fa2 manifestement faux de lui-même, agit pareillement à Na et émet Fb3 :

```
[Fiche partielle Fb3]
PublicKey: P
Block: D3
Endpoints:
Na
```

Et on boucle : Fa4, Fb5, Fa6, Fb7, ...

**Oui mais voilà, le stock de dates (blockstamp) est limité.** En effet, la chaîne de blocs avance à son rythme, de 5 minutes par bloc, et il existe donc un nombre limité de dates consommables.

Au-delà du fait que les nœuds jouent au ping-pong pour savoir qui aura raison, *in fine* l'un d'entre eux ne pourra plus émettre de nouvelle fiche tant qu'un nouveau bloc, et donc une nouvelle date, ne sera pas disponible.

### Le partage du stock

Une solution possible pour ces deux malheureux nœuds, est en réalité *de supposer qu'ils ne sont pas seuls* et que, potentiellement, un autre pair similaire à eux (partageant le même trousseau) se montrera. Comment se montrera-t-il ? Par une fiche de pair.

Concrètement, quand Na reçoit Fb1, il se dit « *Tiens, ce n'est pas de moi car, étant donné ma configuration, je n'aurais pas écrit cela. Je vais vérifier l'adresse inscrite sur cette fiche, il s'agit peut-être d'un de mes semblables.* ». Il établit le contact. S'il n'obtient aucune réponse de Nb, alors il considère qu'il s'agit d'une erreur et émet Fa2 comme précédemment pour corriger le tir auprès du réseau qui pourrait tenter de contacter Na via Fb1, ce qui ne fonctionnerait pas, puisque Na possède l'interface Fa, pas Fb.

Maiiiiis … si jamais Nb répond, alors Na est aux anges : il a trouvé un nœud partageant le même trousseau que lui ! Ce sont des alliés. Pour que chacun puisse être visible du réseau, et étant donné le problème du stock de blockstamp, *les 2 nœuds vont coopérer*. Pour Na qui vient de recevoir Fa1, il va alors émettre une fiche Fab2 qui, comme son code l'indique, *contiendra à la fois l'interface Na et l'interface Nb* :

```
[Fiche partielle Fab2]
PublicKey: P
Block: D2
Endpoints:
Na
Nb
```

Nb reçoit alors cette fiche Fab2 et, ne connaissant pas encore Na, répète l'opération réalisée par Na et vérifie son existence. S'il ne le trouve pas, il émettra une fiche Fb3, mais dans le cas contraire, **il ne fera rien**.

Dans cet ultime cas, il ne consommera donc pas le stock de blockstamp commun à ces deux nœuds. Il l'économisera et, sur une base régulière moins fréquente que l'émission d'un nouveau bloc, ira vérifier que Na est toujours présent et émettra une nouvelle fiche Fab3 le cas échéant (sinon, bien sûr, il émettra une fiche Fb3).

Et bien sûr lorsque Na recevra Fab3, il réitère le processus de réception d'une fiche de pair. Tant que Na et Nb se voient mutuellement, seul l'un d'eux émet et consomme un blockstamp pour mettre à jour la fiche de pair commune, ce qui permet à ce petit réseau de cohabiter et exister de concert parmi le réseau Duniter, tout en partageant le même trousseau et pouvant donc calculer simultanément leur preuve suivante.

> A noter que, si les 2 pairs possèdent *strictement les mêmes données*, et jouent le "Nonce" de la preuve de travail à l'identique (par exemple s'ils ont un Nonce séquentiel à partir de zéro) alors ils calculeront exactement la même preuve, et donc ne tireront aucunement parti d'être plusieurs. Toutefois, étant donné qu'ils ont une fiche de pair indiquant clairement qu'ils sont plusieurs, ils doivent pouvoir s'adapter en conséquence.
>
> Ceci fait l'objet du ticket [#634](https://github.com/duniter/duniter/issues/634) fraîchement saisi alors que je rédige ce billet, me rendant compte du problème :)

Voilà donc comment la déclaration des pairs du réseau Duniter fonctionne !