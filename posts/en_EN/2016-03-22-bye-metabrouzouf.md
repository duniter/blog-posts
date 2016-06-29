# The Meta_Brouzouf experiment is over!

There we are! 14 months after the launch of testing money named *Meta_Brouzouf* on January 21th 2015, it is now time for us to abandon this money and "stop" this experiment in order to go one stage further!

But why? What will happen to this money? And more importantly, what's next?!

Pieces of answer.
## Recalls about Meta_Brouzouf

For those who hadn't followed closely this experiment, here are some recalls to situate the context.
### The initial goal: the birth of new client softwares

The uCoin project started during summer 2013. After a year and a half of development, on January 2015, the bases were considered established and the first pieces of code ready to be tested. It was then important to propose a first currency, was it a testing one, to allow other developers to produce *client softwares* equiped with graphical interfaces easing the money usage.

<center>[![](https://camo.githubusercontent.com/39705402deb44e50a1b48b5ed1206394593278dd/68747470733a2f2f7261772e6769746875622e636f6d2f75636f696e2d696f2f73616b69612f6d61737465722f73616b69612e706e67)](http://sakia-wallet.org)</center> <center>_Logo of the first client: Sakia software_</center>

Indeed, even if uCoin is the software at the heart of the money, its role *is not* to manage *your* transactions specifically, *but to handle any document* making it possible to live.

It is the client softwares that allows usage of money supported by uCoin software, by producing the documents corresponding to your actions and *then send these to the network* in order to treat them: it could be a transaction to pay someone, a certification of some individual from the web of trust or even a membership demand to the monetary community.

The uCoin software, on its side, only treats these documents and adds them to the common register of the currency named *Blockchain* which contains the whole set of the money network data: monetary units, made transactions and individuals of the web of trust.

<center>![image](https://cloud.githubusercontent.com/assets/969136/13917314/40084810-ef60-11e5-86f9-eacfb58b9062.png)</center> <center>_Logo of "Android App" application_</center>

#### The first clients

We can only observe that this objective, at the end of the experiment, was reached! Brave developers gave their body and soul to produce the following precious softwares:

* [Sakia](http://sakia-wallet.org), a complete desktop software for Linux,   Mac and Windows
* [uCoin   App](https://play.google.com/store/apps/details?id=io.ucoin.android), an   Android application for your smartphone
* [uCoinWallet](https://play.google.com/store/apps/details?id=io.ucoin.android.wallet),   another Android application for your smartphone
* [Cesium](http://cesium.ucoin.fr/), a multiplatform client which works in   your favorite browser

#### And even a first server packet!

It's worth noting an active contributor of [YunoHost](http://yunohost.org) team also developed [a uCoin packet for YunoHost](https://github.com/ucoin-io/ucoin_ynh) greatly easing the installation of uCoin for self-hosting addicted people!

<center>[![](https://avatars1.githubusercontent.com/u/1519495?v=3&s=200)](http://yunohost.org/)</center>

### The known limits

Nevertheless, this is experiment was though and built from the start to constitute a **testing currency**. So it had no vocation to last, but instead to test the application in more realistic conditions with the aim to fix the most early and rough bugs.

For this case, we chose parameters which are not compliant with long term working:

* a monetary growth of **10% per day** rather than year
* a minimum number of **3 certifications** to be a member
* a certification and membership expiry delay **limited to 1 month**

It has to be understood that **10% per day** rather than per year is tremendous, indeed the monetary mass grows exponentially: by a year (that is, after a complete revolution of the Earth around its orbit), we create in reality **1,166,641,437,000,000 times more money** than in a normal case. Yes, you read it right: it is a **1 million of billion of times** quicker than 10% a year. The money cannot take value at such a rythm, which prevent it to be used as a medium of exchange for both medium and long term.

As well, the minimum number of **3 certifications** to be a member is enough for a dozen member community but becomes way to light for a bigger community because the rules becomes too easy to pass, and fake accounts are no more bothered by this contraint (these still are bothered by distance rule, however).

Finally, the lifetime of **1 month** for certifications and memberships is way too light. Serveral members of the testing community were rapidly excluded just because of this duration, their certifications and membership being expired. A value of **6 months** would be more acceptable.

For these reasons, no chance for this money to stay in time.

<center>![](http://forum.ucoin.io/uploads/default/original/1X/da2e4d72317b4bb205d2b56001bb1add75435113.png)</center>

## The experiment results

Despite these parameters which promised the early end of this testing currency, this latter totaly played its role notably because [several client software were borns](#thefirstclients), but also no less than **115 users** have actively participated the currency, and this despite of the project youth which requires a certain effort to reach the status of individual creating money.

Indeed to succeed its account creation it was required by each of them to:

* install Sakia client software
* follow an [english   tutorial](https://forum.ucoin.io/t/tutorial-subscribe-to-the-testing-currency/143)   to create their identity in Sakia, connect to the network and publish   their membership demand to the community (and most users were frenchies!)
* make an explicit demande, written on the [uCoin   forum](https://forum.ucoin.io) with few identity proofs in order to   receive certifications

It is thanks to these people that we could find a good number of bugs, minors or majors, but also identify the limits of the protocol in its initial version which necessited to be modified to handle bigger community sizes, which is important for the currency to have a real efficience.



### Some numbers

To end this post and mark the end of this testing currency, we propose you some numbers extracted from [Blockchain](https://en.wikipedia.org/wiki/Block_chain_(database)), the public database shared by the whole currency network, and which you could yourself consult and exploit:

* **424** simulated year
* **137 identities** published with **115 identities** who reached the   member status (and so created money)
* **1676 certifications** of identities were made
* **466** membership / actualizing demands were sent
* **1191 transactions** realized
* **7193** dividends (UD) were created (1 dividend / day / member)
* **1,820,920,587,213,340,000,000** Meta_Brouzouf (money units) created

### The currency stop

> I don't get it, I thought uCoin was based on a peer-to-peer model (P2P) and so this tool was not centralized? How could "stop" the experiment if I, with my personal node, decide to make the adventure going on?

In reality, **we cannot force the stop of the currency**. Indeed, its infrastructure is actually P2P. So if 3 members decide to continue to make the currency live by adding each one there node working and also keep up certifying themselves mutually, then the currency won't stop working.

Simply, these 3 members will have a money "belonging to them", they will be the only ones able to create it and probably the only ones to use it and accept it.

This P2P aspect is crucial to our eyes since it makes extremely hard to take over the control of a libre currency, our common tool of exchange whose lifetime expectancy aims at exceeding human's one.

Yet if we wish to realize a libre currency, this one has to be robust enough and be time proof: for us, only decentralized systems (peer-to-peer) are able to fit this goal. That's why uCoin is P2P software.
### Why stopping this money?

The objectives were reached, and more importantly we were meeting technical limits which no more allow to ensure a good software functionality.

Despite the fact the software still works and users can make it live forever, we do not want to ensure data consistency for this currency anymore.

It might occur to have incorrect amounts of money transfered, or even stranger events! Don't be surprised, we won't: we are already looking in a new direction.
## What's next?

As said earlier, this testing currency was an occasion to discover the limits of this 1st version of the protocol, soberly tagged **0.1**.

We have already implemented its next version **0.2** which carries a lot of newness. And so, what will happen?

The next couple of weeks will tell you.

<center><div style="width: 400px">![](http://forum.ucoin.io/uploads/default/original/1X/5deea7ee59d908a917eb2f099d44e8ee05e50198.png)</div></center> 
