## A cryptocurrency system

uCoin uses the crypto-currency concept introduced by Bitcoin, which is to use cryptography features such as _signature_ to create digital currencies. uCoin fits in this definition, however it has completely different fundation principles than Bitcoin like Web of Trust and Universal Dividend to do _really_ better than Bitcoin. Actually, uCoin has a theoretical reference called [Relative Money Theory](http://vit.free.fr/TRM/en_US/). This theory **demonstrates** that a currency which aims at respecting each individual's economic liberties MUST implement the Universal Dividend (aka. _Basic Income_), which is the only way to avoid both spatial and temporal asymmetry toward money issuance.

## A space-time asymmetry

Space-time asymmetry refers to the relative access of individuals to newly created money. Concretely, all existing currencies (2015) are both spatially and temporally asymmetrical for their users. Let's take Bitcoin example to understand why.

### Spatially

When new Bitcoins are created, _only some Bitcoin users_ (the miners) are credited of brand new Bitcoins, while the others get nothing. **We believe this is the first injustice.** However, some might say:

> <div class="ui message">« but miners used their electricity and time to get it! »</div>

... we would answer this work _shouldn't have been rewarded by newly created Bitcoins_. New Bitcoins should spread the whole Bitcoin community. Miners should be rewared another way, not by money issuance. Of course, Bitcoin can't create money through Basic Income since Bitcoin users are not strongly identified, and one might benefit multiple times of money creation if he owned several wallets. uCoin get rid of this problem in its conception by identifying its users and giving _the same amount to everyone_.

### Temporally

Bitcoin has a planned limit of 21 million BTC, which means less and less bitcoins will be created over the time until 0 remains. So, once first adopters will have mined every bitcoin, how will future joiners do to get bitcoins? Answer is: just like Euros or Dollars. To get money you have to work for the ones who already own it. **We believe this is the second injustice.** Every member of a monetary community should be equal towards money issuance, and get the same relative amount of new money over the time, _even if he is a later adopter_. uCoin aims at fixing this bug too by making Universal Dividend _grow by the time_ according to precise rules allowing members equality toward money issuance on a half-lifespan.

## A solution

Idea is the following: Bitcoin has teached us _it is possible_ to create a currency system allowing both to create digital money and to exchange it without central authority. What we need to change is _the way money is issued_ so we finally has a symmetrical system. We need Bitcoin + Universal Dividend. But Universal Dividend _implies_ to have a community of identified people. This is where Web of Trust (WoT) comes into place: this concept, introduced by cryptography with OpenPGP format, allows us to identify people in a decentralized manner. It works this way: each one creates _a personal identity_, linked to its cyptographical certificate, which has to be confirmed by others members using their own cryptographic key. It is that simple: **people define by themselves who is part of the community and who is not.**

> uCoin however won't use OpenPGP for its cryptographic features: Elliptic Curves will be used instead for the conciseness of its generated keys and the pratical advantages it results from. This involves for us to specify our own Web of Trust mechanisms, but we think it worths the pain.

### The Blockchain

Bitcoin's blockchain mechanism is important for us for two main reasons: **synchronization and security**. uCoin will still use it to benefit from these two features. However, uCoin's blockchain is slightly different: it not only stores transactions but _community variations_ for defining the WoT. It also has a different _Proof-of-Work_ mechanism made possible by WoT definition, providing **a really much more energy efficient way** to compute the blockchain.

#### Web of Trust

The Web of Trust is to be written in our common document: the blockchain. Just the same way Bitcoin's transaction are written in Bitcoin's blockchain, but for identity of people. Thus, blockchain constitutes a _space-time referential_, where _space_ is represented by individuals and _time_ provided by blockchain units: the blocks. What we finally have is **wot(t)**: the community at a _t_ instant.

#### Transactions

But that's not all: blockchain is also the place where _transactions_, the support of money, are sequentially stored and allow to define money ownership. For this part, uCoin really looks like Bitcoin: transactions take inputs (_a.k.a._ sources) and generate outputs. Transaction is a flow of money. However, in uCoin inputs may be:

*   money from another transaction [Bitcoin like]
*   money from a Universal Dividend [uCoin specific]

As you can see, no _generation transaction_ exists in uCoin. This kind of transaction is replaced by _Universal Dividend input_. Outputs, on their side, are always public keys, and not necessarily WoT members' public keys: _companies_ may also have public key. This lead us to an important fact: **companies are also able to use the currency**.

> Do note carefully that, even if they may participate, **companies won't be able to create money**. Only individuals will able to do it. This is a very important point.

#### Proof of Work

Like any P2P crypto-currency system, uCoin has a way to synchronize its peers for writing its common document (the blockchain). However, uCoin's benefiting from a really different environment than other altcoins: **an identified Web of Trust**. This little difference has a tremendous impact: while Bitcoin has to make a **global trial** using CPU resource to avoid blockchain's hijacking by few people, uCoin has the possibility to rely on its members to write the blockchain: this allows us to both avoids the energy wasting problem introduced by PoW & easily sweep away the 51% attack in uCoin. Concretely, uCoin has a **personalized trial** for each of its members that is getting harder for the member who succeeds writing a block, while it is getting easier - until a given floor - for the others. This mechanism ensures a rotation in the blockchain's writing, while keeping the advantage of PoW for synchronizing the peers.

> It can be noted too that, since a block does not provide extra money creation, members won't be pushed into competing for writing next block.

### To summarize

uCoin's blockchain can be compared to Bitcoin's blockchain: a great book tracing the history of each membership inside the Community along with the transactions of its users. With the blockchain, we have the **fundamental referential** of the [Relative Money Theory](http://vit.free.fr/TRM/en_US/) (humans), and the flow of transactions emitted by the currency users.

## A free economy

The goal of all this is to allow people to participate to a _free economy_ thanks to a _free currency_. What is a free economy? [Relative Money Theory](http://vit.free.fr/TRM/en_US/) defines it through 4 economic freedoms:

*   **The freedom to choose your currency system**: because money should not be imposed
*   **The freedom to access resources**: because we _all_ should have access to economic & monetary resources
*   **The freedom to estimate & produce value**: because value is a purely relative to each individual, in space and time
*   **The freedom to trade with the money**: because we should not be limited by the avaible money supply

Those 4 economic freedoms should be understood together, not exclusively. Plus, _"freedom"_ has to be understood as "_non-nuisance_". So here, _freedom_ does not mean the right to take all of a resource (like water source in a desert) so no more is available to the others. Now you get it, this is the goal: _free economy through free currency._
