# Duniter blog's posts

This repository contains all blog's posts, either it was written in french, english or another language.

## Deploy

### Configuration

To deploy posts on a [Ghost blog](https://ghost.org/), you need to edit [publish-to-blog.sh](https://github.com/duniter/blog-posts/blob/master/publish-to-blog.sh) file to put the 4 following parameters:

```
# -------------- CONFIG TO BE CHANGED --------------
TARGET=http://fr.duniter.org
USER=someuser@blog.info
PASSWORD=ultraSafePassword
EXPORT_LANG=fr_FR
# -------------------------------------------------
```

* `TARGET` is the URL of the blog where the posts will be injected
* `USER` must be a valid user account already configured on that blog (must be an admin account)
* `PASSWORD` is the password associated with `USER`
* `EXPORT_LANG` is the language in which the posts must be translated if possible

> Above parameters are not production parameters, it won't actually work. It's just an example of values.

### Launch translation + deploy

Finally, just run the script to execute posts translation and their deployment on the targeted blog:

```
$ ./publish-to-blog.sh
Translating...
Found en_EN post: 2015-01-11-welcome-to-ghost-2.fr_FR.po
Found en_EN post: 2015-02-05-ucoin-at-the-5th-freedom-money-meeting.fr_FR.po
Found en_EN post: 2015-06-09-recap-of-the-5th-fmm-4-days-focusing-on-money-systems.fr_FR.po
Found en_EN post: 2015-08-11-faq.fr_FR.po
Found en_EN post: 2015-08-11-presentation.fr_FR.po
Found en_EN post: 2015-08-11-theoretical.fr_FR.po
Found en_EN post: 2015-08-14-contact.fr_FR.po
Found en_EN post: 2015-08-14-contribute.fr_FR.po
Found en_EN post: 2015-08-14-try.fr_FR.po
Found fr_FR post: 2015-09-29-les-6emes-rencontres-des-monnaies-libres-a-valence-du-12-au-15-novembre.fr_FR.po
  adding: published-2015-01-11-welcome-to-ghost-2.md (deflated 40%)
  adding: published-2015-02-05-ucoin-at-the-5th-freedom-money-meeting.md (deflated 53%)
  adding: published-2015-06-09-recap-of-the-5th-fmm-4-days-focusing-on-money-systems.md (deflated 58%)
  adding: published-2015-08-11-faq.md (deflated 61%)
  adding: published-2015-08-11-presentation.md (deflated 56%)
  adding: published-2015-08-11-theoretical.md (deflated 60%)
  adding: published-2015-08-14-contact.md (deflated 58%)
  adding: published-2015-08-14-contribute.md (deflated 49%)
  adding: published-2015-08-14-try.md (deflated 43%)
  adding: published-2015-09-29-les-6emes-rencontres-des-monnaies-libres-a-valence-du-12-au-15-novembre.md (deflated 49%)
Publishing...
Setting post /faq as static page...
Setting post /presentation as static page...
Setting post /theoretical as static page...
Setting post /contact as static page...
Setting post /contribute as static page...
Setting post /try as static page...
>> The blog has been updated successfully!
```
