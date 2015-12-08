# Publier un article sur le blog

Le blog ucoin.io a subit depuis peu une transformation technique : désormais [l'intégralité des articles du blog](https://github.com/ucoin-io/blog-posts/tree/master/posts) est mise à disposition sur GitHub.

Pour quoi faire ? Très simplement, nous apprécions de pouvoir découpler le contenu du contenant, en l'occurrence découpler les articles du moteur de blog qui les affiche. Cela nous permet entre autres choses :

* de [traduire](http://weblate.ucoin.io/projects/ucoin-blog/) les articles avec des outils comme Weblate
* de migrer vers un autre moteur de blog dans le futur, de façon automatisée
* de proposer une rédaction communautaire des articles à travers la plateforme [GitHub](http://github.com)

C'est ici le dernier point qui nous intéresse ! Vous permettre de rédiger des articles. Voyons sans plus attendre comme procéder.

## Première étape : rédigez votre article

Pour commencer, il vous faut rédiger votre contenu, de préférence avec un éditeur Markdown (c'est le format attendu des articles du blog) comme [Dillinger](http://dillinger.io/).

Tapez simplement votre article puis sauvegardez-le dans un fichier sur votre disque dur.

## Deuxième étape : publiez-le sur votre dépôt

Cette étape consiste à publier votre article sur un dépôt GitHub, sur Internet.

### Créez un compte GitHub

> Si vous disposez déjà d'un compte GitHub, vous pouvez passer cette étape.

Rendez-vous sur https://github.com (site en anglais). Renseigner les 3 champs proposés :

* Nom d'utilisateur
* E-mail
* Mot de passe

![image](https://cloud.githubusercontent.com/assets/969136/11662425/d0a2883a-9dd6-11e5-927b-d6939fb8fe50.png)

Vous recevrez probablement un e-mail de confirmation qu'il vous faudra valider. Une fois cette étape passée, vous devriez disposer d'un compte GitHub !

### Forkez le dépôt principal

> Si vous avez déjà forké le dépôt principal [ucoin-io/blog-posts](https://github.com/ucoin-io/blog-posts), vous pouvez passer cette étape.

Rendez-vous à l'adresse https://github.com/ucoin-io/blog-posts. Cliquez sur le bouton « Fork » en dans le coin supérieur droit de la page :

![image](https://cloud.githubusercontent.com/assets/969136/11662678/2d26d542-9dd8-11e5-8e81-2e91941926cb.png)

Vous aurez alors *votre propre version* des articles du blog, dans *votre dépôt* GitHub.

![image](https://cloud.githubusercontent.com/assets/969136/11662708/65b18ae2-9dd8-11e5-8f24-7784ece9ef14.png)

### Ajoutez votre article

Il est maintenant temps d'ajouter votre article fraîchement rédigé ! Pour ce faire, cliquer sur le dossier « posts » puis cliquer sur le bouton « New file ».

![image](https://cloud.githubusercontent.com/assets/969136/11662786/d777afbc-9dd8-11e5-964c-861d34f7578d.png)

#### Ajoutez votre contenu

Dans la zone d'édition, copiez/coller l'ensemble du contenu de votre article Markdown.

> Très important : votre fichier doit débuter par une ligne de titre, c'est-à-dire débuter par un `#` puis un message qui fera office de titre d'article. Par exemple, `# Bonne année !` est une ligne de titre valide.

#### Choisissez un nom de fichier

Cette étape est cruciale. C'est à travers celle-ci que vous définirez :

* La date de publication de votre article
* Le chemin web par lequel sera accessible votre article

Le nom du fichier doit être de la forme suivante : `AAAA-MM-JJ-nom-du-chemin.md`. Par exemple `2015-12-31-bonne-annee.md` pour un article souhaitant la nouvelle année le 31/12/2015.

L'article sera alors disponible à l'adresse http://fr.ucoin.io/bonne-annee/, et sera marqué comme ayant été publié le 31/12/2015.

> Attention ! Le chemin web ne doit contenir que des chiffres, lettres et tirets, le tout en minuscules. Faites-le commencer par une lettre.

Vous pouvez désormais valider l'ajout de votre fichier en cliquant sur le bouton vert « Commit new file ».

![image](https://cloud.githubusercontent.com/assets/969136/11662968/db9387e6-9dd9-11e5-89b7-6a46fbd7cf75.png)

### Indiquez la langue de votre article

Votre article a été rédigé dans une langue, mais nous ne savons pas *a priori* laquelle. Vous pourriez très bien rédiger dans la langue de votre choix. Nous avons toutefois besoin de savoir laquelle.

Pour ce faire, aller dans le dossier « meta » puis cliquer sur le fichier correspondant à votre langue :

* `fr_FR` si vous avez rédigé votre article en Français
* `en_EN` si vous avez rédigé votre article en Anglais

Puis cliquez sur « Edit » pour modifier le fichier :

![image](https://cloud.githubusercontent.com/assets/969136/11663137/cbfcb298-9dda-11e5-93dc-ec1ae38ead37.png)

Ajoutez alors le nom du fichier que vous avez choisi pour votre article à la fin du fichier :

![image](https://cloud.githubusercontent.com/assets/969136/11663291/aa0b218c-9ddb-11e5-9cc6-5371c8b64481.png)

Puis cliquez sur « Commit changes » pour valider.

## Troisième étape : partagez-le avec notre dépôt

Votre article est désormais prêt à être partagé ! Pour ce faire c'est très simple : sur la page principale de votre dépôt, cliquez sur « New pull request » :

![image](https://cloud.githubusercontent.com/assets/969136/11663449/925e612e-9ddc-11e5-9cbd-d73df99c9277.png)

Puis sur la page suivante, si tous les voyants sont verts, cliquez sur « Create pull request » afin de valider votre demande :

![image](https://cloud.githubusercontent.com/assets/969136/11663712/058a0602-9dde-11e5-9b0e-f729b2e7d748.png)

## Dernière étape : attendez notre validation

Votre demande d'ajout est désormais effective ! Nous allons vérifier que vous avez bien respecté les consignes en termes de nom de fichier, date d'article, langue et contenu. Si tout est dans les règles, nous n'aurons qu'à cliquer sur un bouton pour que votre article soit visible sur le site dans la minute qui suit !

Toutefois, même si nous recevons une notification de proposition de nouvel article, soyez patients : nous ne sommes pas toujours disponible immédiatement pour valider vos articles !

Mais n'en doutez pas : si votre article convient, nous le publierons.

En vous remerciant d'avance pour vos futures contributions !
