# Publier ou modifier un article sur le blog

Le blog [duniter.org](https://fr.duniter.org) a subit depuis peu une transformation technique : désormais [l'intégralité des articles du blog](https://github.com/duniter/blog-posts/tree/master/posts/fr_FR/) est mise à disposition sur GitHub.

Pour quoi faire ? Très simplement, nous apprécions de pouvoir découpler le contenu du contenant, en l'occurrence découpler les articles du moteur de blog qui les affiche. Cela nous permet entre autres choses :

* de traduire les articles en ajoutant des dossiers de langue ([voir l'exemple de l'anglais](https://github.com/duniter/blog-posts/tree/master/posts/en_EN)) 
* de migrer vers un autre moteur de blog dans le futur, de façon automatisée
* de proposer une rédaction communautaire des articles à travers la   plateforme [GitHub](http://github.com)

C'est ici le dernier point qui nous intéresse ! Vous permettre de rédiger des articles, ou même de modifier ceux existants. Voyons sans plus attendre comme procéder.

## Première étape : forkez le dépôt principal

Pour participer de la rédaction des articles, qu'il s'agisse de création ou de modification, vous travaillerez avec votre propre copie que vous partagerez ensuite. Vous devez donc créer votre propre copie du blog, un *fork* dans le jargon technique.

### Créez un compte GitHub

> Si vous disposez déjà d'un compte GitHub, vous pouvez passer cette étape.

Rendez-vous sur https://github.com (site en anglais). Renseigner les 3 champs proposés :

* Nom d'utilisateur
* E-mail
* Mot de passe

![image](https://cloud.githubusercontent.com/assets/969136/11662425/d0a2883a-9dd6-11e5-927b-d6939fb8fe50.png)

Vous recevrez probablement un e-mail de confirmation qu'il vous faudra valider. Une fois cette étape passée, vous devriez disposer d'un compte GitHub .
### Forkez le dépôt principal

> Si vous avez déjà forké le dépôt principal [duniter/blog-posts](https://github.com/duniter/blog-posts), vous pouvez passer cette étape.

Rendez-vous à l'adresse https://github.com/duniter/blog-posts. Cliquez sur le bouton « Fork » en dans le coin supérieur droit de la page :

![image](https://cloud.githubusercontent.com/assets/969136/11662678/2d26d542-9dd8-11e5-8e81-2e91941926cb.png)

Vous aurez alors *votre propre version* des articles du blog, dans *votre dépôt* GitHub.

![image](https://forum.duniter.org/uploads/default/original/1X/fc58e753585935dfd107ac33d411e0a4b690fad3.png)


## Deuxième étape : clonez votre fork

Maintenant que vous possédez une copie dans votre dépôt GitHub, votre fork, il convient maintenant de récupérer une copie locale que vous pourrez modifier. C'est l'étape de *clonage*.

La copie distante est en quelque sorte la référence pour *pour les autres utilisateurs* qui peuvent ainsi voir l'état de votre code. Mais vous, vous travaillez sur les fichiers présents sur votre PC.

### Installer Git

L'installation de Git dépend de votre système d'exploitation. Suivez simplement les indications présentes sur : https://git-scm.com

### Cloner votre fork

A ce stade, vous êtes en mesure de récupérer votre version du code source (votre *fork*), afin de pouvoir travailler dessus.

#### Ouvrez Git en ligne de commande

Pour récupérer le code source, lancez Git en mode console.

* Sous Linux et MacOS, ouvrez tout simplement le Terminal
* Sous Windows lancez le programme *Git Bash* :

<img src="https://forum.duniter.org/uploads/default/original/1X/6fc638dc0a22d88da7e84dbf0371e69747767f78.png" width="432" height="80">

#### Clonez votre fork

Retournez sur la page web GitHub, puis trouvez le bouton « Clone or download » : 

<img src="https://forum.duniter.org/uploads/default/original/1X/188450ce5f807c958c2a7efb72bf89c0febb94ab.png" width="459" height="159">

Cliquez dessus, vous pourrez alors copier l'URL de clonage en cliquant sur l'icône de valise : 

<img src="https://forum.duniter.org/uploads/default/original/1X/7e84f49d0cae40790abdccfb9f22551b76d07b34.png" width="457" height="199">

Vous n'avez plus qu'à retourner dans votre console Git et saisir : 

    git clone <coller l'URL copiée>

ce qui donne dans mon cas : 

```
git clone https://github.com/c-geek/blog-posts.git
Clonage dans 'blog-posts'...
remote: Counting objects: 713, done.
remote: Total 713 (delta 0), reused 0 (delta 0), pack-reused 713
Réception d'objets: 100% (713/713), 336.82 KiB | 597.00 KiB/s, fait.
Résolution des deltas: 100% (427/427), fait.
Vérification de la connectivité... fait.
```

Si vous êtes arrivés à un comportement similaire, **c'est parfait**, vous avez réussi à cloner votre dépôt en local !

## Troisème étape : effectuez des modifications 

Vous pouvez désormais travailler tranquillement à la rédaction d'un nouvel article ou à la modification d'un article existant. Dans les 2 cas, vous devrez valider votre travail une fois terminé et publier vos changements sur votre dépôt (c'est une action de *push*) puis nous les proposer (c'est une action de *pull-request*, abrégé *PR*) pour publication. 

### Ajouter ou modifier un nouvel article

Le principe est le suivant : chaque article est matéralisé par un fichier au format [Markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet). Ce type de fichier se termine par l'extension `.md`. Ainsi le fichier suivant est un fichier Markdown :

    posts/fr_FR/2016-06-27-sortie-officielle-0.20.0.md

**Pour créer un nouvel article**, il vous suffit de créer un fichier similaire, en changeant de nom.

**Pour modifier un article existant**, modifiez simplement le contenu du fichier concerné.

Vous êtes libres quant au nom de fichier et au contenu de votre article, mais vous devez respecter les quelques règles simples ci-après.

### Règles sur le nom de fichier

**Le nom de fichier est très important**. C'est à travers celui-ci que vous définirez :

* La date de rédaction de votre article
* Le chemin web par lequel sera accessible votre article

Le nom du fichier doit être de la forme suivante : `AAAA-MM-JJ-nom-du-chemin.md`. Par exemple `2015-12-31-bonne-annee.md` pour un article souhaitant la nouvelle année le 31/12/2015.

L'article sera alors disponible à l'adresse http://fr.duniter.org/bonne-annee/, et sera marqué comme ayant été rédigé le 31/12/2015.

> Attention ! Le chemin web ne doit contenir que des chiffres, lettres, tirets et points, le tout en minuscules. Faites-le commencer par une lettre.

### Règle de la ligne de titre

Très important : votre fichier doit débuter par une ligne de titre, c'est-à-dire débuter par un `#` puis un message qui fera office de titre d'article. Par exemple, `# Bonne année !` est une ligne de titre valide.

### Regardez les exemples !

Si vous vous sentez perdus, prenez simplement les autres fichiers comme exemple ! Tous ceux présents, mis à part vos propre fichiers, sont déjà publiés sur le blog et donc parfaitement valides. Inspirez-vous-en !

Voici, à titre informatif, le contenu du fichier d'exemple :

    # Exemple

    Ceci est un exemple d'article désactivé. Il ne sera jamais publié, tant qu'il reste dans ce dossier.

    ## Règles importantes

    * **Ne pas déplacer cet article dans le répertoire parent : cela publierait automatiquement l'article !**
    * **Ne pas supprimer cet article : le répertoire courant ne dois jamais devenir vide !**

### Langue de votre article

Les articles sont pour le moment rédigés *soit en français soit en anglais*. Selon la langue choisie, l'article sera publié :

* ou bien sur http://fr.duniter.org pour un article en français
* ou bien sur http://en.duniter.org pour un article en anglais

Pour indiquer la langue choisie, il vous suffit de placer votre article dans un sous-dossier `posts/`, il en existe aujourd'hui deux : 

* `fr_FR` si vous avez rédigé votre article en français
* `en_EN` si vous avez rédigé votre article en anglais

Soyons clairs : nous ne publierons pas les articles écris en français sur le blog en version anglaise, et inversement.

> Il pourrait existe davantage de langues en ajoutant de nouveaux dossiers : toutefois ne souhaitons pas déployer d'autres versions du blog pour le moment, 2 langues suffisent amplement pour le moment.

## Quatrième étape : validez et publiez vos changements

> N.B. : nous allons ici utiliser Git en ligne de commande étant donné que celle-ci ne diffère pas d'un système à l'autre. Mais vous pouvez utiliser l'outil de votre choix pour faire la même chose : il existe par exemple des outils graphiques, bien plus commodes à utiliser : vous en trouverez plusieurs à l'adresse https://git-scm.com/downloads/guis

### Ajouter les modifications au commit

La commande est simple :

    git add posts

Cela ajoutera l'ensemble des modifications effectuées sur le répertoire `posts/`, où se trouve forcément votre article.

### Valider les modifications

Utilisez la commande :

    git commit

Un message descriptif succint vous sera demandé, puis vos modifications seront enregistrées.

### Partagez vos modifications

Pour envoyer vos commits sur votre fork, utilisez : 

    git push origin master

## Cinquième étape : demandez la publication 

Vous avez poussé (*pushé*) vos modifications sur votre dépôt GitHub, votre *fork*, celles-ci sont donc désormais visibles. *Mais cela ne publie pas pour autant vos modifications sur le blog* : vous devez nous proposer ces changements et, si nous les acceptions, *alors* ceux-ci seront automatiquement intégrés et publiés dans l'instant sur le blog.

Pour partager vos modifications, c'est très simple : sur la page principale de votre dépôt, cliquez sur « New pull request » :

![image](https://cloud.githubusercontent.com/assets/969136/11663449/925e612e-9ddc-11e5-9cbd-d73df99c9277.png)

Puis sur la page suivante, si tous les voyants sont verts, cliquez sur « Create pull request » afin de valider votre demande :

![image](https://cloud.githubusercontent.com/assets/969136/11663712/058a0602-9dde-11e5-9b0e-f729b2e7d748.png)

## Dernière étape : attendez notre validation

Votre demande d'ajout est désormais effective ! Nous allons vérifier que vous avez bien respecté les consignes en termes de nom de fichier, date d'article, langue et contenu. Si tout est dans les règles, nous n'aurons qu'à cliquer sur un bouton pour que votre article soit visible sur le site dans la minute qui suit !

Toutefois, même si nous recevons une notification de proposition de nouvel article, soyez patients : nous ne sommes pas toujours disponible immédiatement pour valider vos articles !

Mais n'en doutez pas : si votre article convient, nous le publierons.

En vous remerciant d'avance pour vos futures contributions ! 

## Pour vos futures modifications

Il se peut que vous deveniez un contributeur actif au blog, en publiant plusieurs articles par exemple. Dans ce cas, *vous devrez mettre à jour votre fork et votre clone* par rapport au dépôt du blog. C'est-à-dire que votre clône et fork devront récupérer les modifications que nous aurions pu apporter avant de nous proposer une modification ou un ajout d'article.

### Ajouter le dépôt principal aux dépôts distants de votre clone

Pour l'instant, votre clone dispose d'un seul dépôt : *origin*. Il s'agit en fait de votre fork.

Mais vous pouvez ajouter autant de dépôts que vous le souhaitez, c'est là tout l'intérêt de Git ! Et notamment, ajouter le dépôt que manipule le blog : [duniter/blog-posts](https://github.com/duniter/blog-posts.git)

Pour ce faire, lancez la commande :

    git remote add blog https://github.com/duniter/blog-posts.git

Vous n'aurez pas besoin de rétirer cette commande par la suite.

### Récupérer les dernières modifications du dépôt principal

Cela se fait simplement avec la commande : 

    git pull blog master

> Attention : il se peut que des conflits apparaissent si vous avez modifié des fichiers en même temps que d'autres personnes, et que ces modifications entrent en conflit. Dans ce cas vous aurez à arbitrer les conflits ! Voici un petit manuel pour vous en sortir dans un tel cas : http://alainericgauthier.com/git/gerer_les_conflits_de_fusion

### Procéder comme d'habitude

Vous pouvez ensuite reprendre le processus de l'étape 3 à 5. C'est tout ! 

## Questions complémentaires

### Que signifie le répertoire `static` dans l'arborescence du blog ?

Il s'agit d'un répertoire abritant des articles spéciaux : ceux-ci ne sont pas publiés à la suite des autres articles, mais forment des pages du blog à part entière. Nous les utilisons pour des pages comme :

* la page de [Présentation](http://fr.duniter.org/presentation/)
* la page de [Théorie](http://fr.duniter.org/theoretical)
* la page de [Contact](http://fr.duniter.org/contact)
* la page de [Contribution](http://fr.duniter.org/contribute)
* ...

Vous pouvez vous aussi y placer votre article, toutefois cela nécessite également que nous placions un lien pour y accéder par la suite.

Nous utiliserons notamment les pages statiques pour les tutoriels d'utilisation de Duniter et ses clients (Sakia, Cesium, ...).

### Que signifie le répertoire `disabled` dans l'arborescence du blog ?

Il s'agit des articles que l'on souhaite désactiver du blog s'ils ont été publiés, ou des articles en cours de rédaction mais déjà ajoutés au dépôt principal. Ces articles **ne sont donc pas visibles** sur le blog.

Cela peut aussi nous aider à mettre temporairement hors ligne un article, un article alternatif est alors affiché (le contenu du fichier `2016-06-29-editing.md`).

### Peut-on modifier d'autres parties du blog, comme le menu latéral ou les éléments de la page d'accueil ?

Pour le moment non, mais cela sera possible très prochainement ! Il sera par exemple possible d'afficher : 

* les dernières versions disponibles des logiciels
* les bandeaux promotionels pour les évènements à venir (Rencontres des Monnaies Libres par ex.)