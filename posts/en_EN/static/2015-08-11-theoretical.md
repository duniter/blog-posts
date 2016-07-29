# Theoretical

## A cryptocurrency system

Duniter uses the crypto-currency concept introduced by Bitcoin, which is to use cryptographic tools such as _signatures_ to create digital currencies. Duniter fits this definition, but it has completely different inspirations than Bitcoin -- the Web of Trust and Universal Dividend -- to do better than Bitcoin. Actually, Duniter has a reference to a theory called [Relative Money Theory](http://vit.free.fr/TRM/en_US/). This theory demonstrates that a currency which aims to _respect each individual's economic liberties_ **MUST** implement the Universal Dividend (a.k.a. _Basic Income_), which is the only way to avoid both spatial and temporal asymmetry toward money issuance.
## A space-time asymmetry

Space-time asymmetry refers to the relative access of individuals to newly created money. Concretely, all existing currencies (c. 2015) are both spatially and temporally asymmetrical for their users. Let's take Bitcoin as an example to understand why.
### Spatial-asymmetry

When new Bitcoins are created, _only some Bitcoin users_ (the miners) are given new Bitcoins, while everyone else get nothing. **We believe this is the _first_ injustice.** However, some might say:

> <div class="ui message"> &quot;but miners used their <i>electricity and time</i> to get it!&quot; </div>

... we would answer that _their_ work _shouldn't have been rewarded by newly created Bitcoins_. New Bitcoins should be distributed to the whole Bitcoin community. Miners should be rewared another way, but not by money issuance. Of course, Bitcoin can't create money through Basic Income since _Bitcoin users are not strongly identified_, and one might benefit from money creation multiple times if he owned several wallets. Duniter gets rid of this problem completely by identifying its users and giving _the same amount [of Basic Income] to everyone_.
### Temporal-asymmetry

Bitcoin has an absolute limit of 21 million BTC (its unit of currency), which means ever fewer bitcoins will be created over time until 0 are being generated. So, once the first adopters have mined every bitcoin, how will future joiners get Bitcoins? The answer -- just like Euros or Dollars: to get money you have to work for the ones who already own it. **We believe this is the _second_ injustice.** Every member of a monetary community should be equal with regard to earning money, and get the same relative amount of money over time, _even if he is a late adopter_. Duniter aims to fix this by making the Universal Dividend (a.k.a. _UD_) _grow by the time_ according to precise rules, thus making members equal toward money issuance on a half-lifespan.
## A solution

Bitcoin has taught us that _it is possible_ to create a currency system allowing one to both create digital money and to exchange it without a central authority. What we need to change is _the way money is issued_ so we finally have a symmetrical system. We need Bitcoin *+ Universal Dividend*. But Universal Dividend _implies_ that the community consists of only identified people. This is where the Web of Trust (WoT) comes into place. This concept, introduced by cryptography with the [OpenPGP](https://www.wikiwand.com/en/Pretty_Good_Privacy) format, allows us to identify people in a _decentralized_ manner. It works as follows: each person creates _a personal identity_ that is linked to its cyptographic certificate. The identity must be confirmed by others members who use their own cryptographic key. It is that simple: **people choose who is part of the community and who is not, not a central authority.**

> Duniter however won't use OpenPGP for its cryptographic features: Elliptic Curves will be used instead for the conciseness of its generated keys and its pratical advantages. This requires that we specify our own Web of Trust mechanisms, but we think it is worth the effort.
### The Blockchain

Bitcoin's blockchain mechanism is important for two main reasons: **synchronization** and **security**. Duniter will benefit from these two features. However, Duniter's blockchain is slightly different: it not only stores transactions, but _community activity_ for defining the WoT. It also has a different _Proof-of-Work_ (PoW) mechanism made possible by the WoT definition, providing **a much more energy-efficient way** to compute the blockchain.
#### Web of Trust

The Web of Trust is to be written in our shared public ledger, the blockchain, in just the same way Bitcoin's transactions are written in Bitcoin's blockchain, but for us it is the identity of people. Thus, the blockchain constitutes a _space-time referential_, where _space_ is represented by individuals and _time_, provided by blockchain units, is the blocks. What we finally have is **wot(t)**: the community at an instant, _t_.
#### Transactions

But that's not all: the blockchain is also the place where _transactions_, the flow of money, are sequentially stored and define money ownership. In this area, Duniter looks quite a bit like Bitcoin: transactions take inputs (a.k.a. _sources_) and generate outputs. A transaction is a flow of money. However, in Duniter inputs may be:

*   money from another transaction [Bitcoin-like]
*   money from a Universal Dividend [Duniter-specific]

As you can see, no _generation transaction_ (where a miner earns Bitcoins for solving a block) exists in Duniter. This kind of transaction is replaced by _Universal Dividend input_. Outputs, on their hand, are always public keys, and not necessarily WoT members' public keys: _a company_ may also have a public key. This lead us to an important fact: **companies are also able to use the currency**.

> Do note carefully that, even if they may participate, **companies won't be able to create money**. Only individuals will be able to do it. This is a very important point.
#### Proof of Work

Like any P2P crypto-currency system, Duniter has a way to synchronize its peers when writing to the ledger (the blockchain). However, Duniter benefits from a different environment than other altcoins: **an identified Web of Trust**. This little difference has a tremendous impact: while Bitcoin has to make a **global challenge** using CPU resources to avoid just a few people from hijacking the blockchain, Duniter has the ability to rely on its members to write the blockchain. This allows us to both avoid the energy-wasting problem introduced by PoW and easily prevent the 51% attack in Duniter. Concretely, Duniter has a **personalized challenge difficulty** for each of its members that gets harder for the member who succeeds in writing a block, while it gets easier - until a given minimum - for the others. This mechanism ensures a rotation in the blockchain's writing, while keeping the advantage of PoW for synchronizing the peers.

> It can be noted too that, since a block does not provide extra money creation, members won't be encouraged to compete to write the next block.
### To summarize

Duniter's blockchain can be compared to Bitcoin's blockchain: a great book tracing the history of each membership inside the Community along with the transactions of its users. With the blockchain, we have the **fundamental referential** of the [Relative Money Theory](http://vit.free.fr/TRM/en_US/) members (humans), and the flow of money through the transactions generated by the currency's users.
## A free economy

The goal of all this is to allow people to participate in a _free economy_ thanks to a _free currency_. What is a free economy? [Relative Money Theory](http://vit.free.fr/TRM/en_US/) defines it through 4 economic freedoms:

*   **The freedom to _choose_ your currency system**: because money should not be imposed
*   **The freedom to access resources**: because we _all_ should have access to economic & monetary resources
*   **The freedom to estimate and produce value**: because value is a purely relative to each individual
*   **The freedom to trade with the money**: because we should not be limited by the avaible money supply

Those 4 economic freedoms should be understood together, not exclusively. Plus, _"freedom"_ has to be understood as "_non-nuisance_". So here, _freedom_ does not mean the right to take all of a resource (like water source in a desert) so no more is available to the others. Now you get it, this is the goal: _free economy through free currency._ 
