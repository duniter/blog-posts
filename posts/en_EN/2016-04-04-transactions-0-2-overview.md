# An overview of 0.2 protocol : transactions

This one will let us realize many new things, like creating advanced applications based on ucoin blockchains or even interface with existing crypto-currencies !

What was missing in 0.1 protocol ? Why did this lacks had to be fixed ? This article, oriented to the developers, should be of interest for anyone interested in blockchains and linked technologies.
## What was missing in 0.1 protocol

We created 0.1 protocol with a really simple goal. To create a blockchain able to track the origin of money, to ensure that [double-spending]((https://en.wikipedia.org/wiki/Double-spending) ) abuses are not feasible, and only individuals could co-create money.   To do so, we used the principle initiated by [Bitcoin](https://en.wikipedia.org/wiki/Bitcoin) : a blockchain, which let us, from block to block, track the money, from address to address. Money is trackable from present to its creation. We can check that it was created by a member of the community at this date, and that it was spent only once at a time.   This protocol let us develop really fast simple applications using the universal dividend. Any individual member co-creates money, and can transfer it to another address. The form of a transaction was as the following :  

```
ISSUERS: List of identifiers of issuers signing this transaction
INPUTS: List of source transactions, to which the signers must be the owners
OUTPUTS: Identifiers of the recipients of this transaction
SIGNATURES
```

But this protocol didn't let us create advanced features really important about money. To understand, we have to get back to a choice realized on the design of our monetary software.

<center>![WoT](https://cloud.githubusercontent.com/assets/1170293/13174860/c1448e88-d706-11e5-8724-5df6b7421bdd.png)</center>

uCoin is a software which identifies its users thanks to a [web of trust](https://en.wikipedia.org/wiki/Web_of_trust). For the individuals to be identified, they certify a trust of existence and uniqueness. This act, from individual to individual, composes a web which lets anyone knowing who is recognized by whom. However, for the individuals to be recognized, and to stop [sybil attacks](https://en.wikipedia.org/wiki/Sybil_attack) from happening, this web has to be tense and tight. A sybil attack consists in creating many fake identities to take the control of the network and the monetary community. Important efforts have to be executed for a cheater to multiply identities, so that cheating remains a minor factor.

The consequence is that individuals have to be able to create many communities (and so, many moneys). Indeed, the web of trust is of a limited diameter (we will talk in details about it in a later article). Individuals need to be able to create many monetary communities so that any individual has the right to co-create a free money. Furthermore, creating many communities let us test many web of trust rules, looking for the best parameters. Thus, dozens of communities could potentially exist, and will have to exchange their money thanks to change rates. This exchange relationships has to be as automated as possible so that it is transparent for the users. Also, we would like to avoid having to introduce any trusted third party.

<center>![Swap exchange](https://framapic.org/uyFv0qtS0yjG/kWXNVu4DAmDg)</center>

In protocol 0.1, it is not possible to automate this inter-community exchange. Indeed, the exchange needs both party to trust each other because no transactional lock is possible in the blockchain :

<center>![Protocol swap exchange with protocol](https://framapic.org/HJy2i4kgTQBv/vnaHkPJdcHFH)</center>

You see : we had to find a solution and enhance our blockchain.
## Never reinvent the wheel

Bitcoin universe is rich, after 7 years of experimentation, their blockchain suffered by defects. Developers had to answer to many limitations, and had to create new features often. Even today, Bitcoin community continues to evolve and to think about developments to realize to enhance this software.

In Bitcoin blockchain, it is notably possible to program [scripted transactions](https://en.bitcoin.it/wiki/Script) in a language which is not [turing complete](https://en.wikipedia.org/wiki/Turing_completeness). This scripting language let us experiment and realize new features using Bitcoin blockchain, without having to develop new versions of the software.

Bitcoin universe has also seen many [alternate crypto-currencies](https://coinmarketcap.com/) appear. Often, these forks are realized using simple cipher algorithm changes, or consensus algorithms. These alternative currencies let them users get their part of monetary creation, because Bitcoin does not anymore. Indeed, first miners have reaped everything, and one must now work for them to get his share.

For users to realize safe places of change, the algorithm of crosschain transactions appeared. It makes users of distinct moneys be able to exchange between them monetary units without trusted third party, and without the need to trust each other. These units are present in different blockchains, and yet, crosschain exchange will link the exchange between the two blockchains.

<center>![Protocol 0.2 swap transactions](https://framapic.org/GsAAbeI5Nk6B/NyzAFH2sPuoS)</center>

Previous example presents an ideal case, where Alice and Mark exchange their money without any interruption in the process. You should note that money can here get stuck in the blockchain : if Mark sends his money to Alice, and Alice does not answer anymore, Mark cannot get his money back. This is why it is necessary to introduce refund documents in the process. These documents are transactions which refund money owners. The algorithm is a bit more complex, so hang on :

<center>![protocol 0.2 refund](https://framapic.org/to5m3slfBWjb/3h2TUn0Wk1Ws)</center>

## Keep It Simple

To develop a scripting language into our transactions would have necessitate to much efforts, while we do not want our blockchain to transform in an application blockchain. We decided to develop this transaction mechanism in his simplest form : a writable condition in the blockchain.

How does it works concretely ? Transactions still have a form of *Input* -> *Output*. Input his what is available for spending, while the output corresponds to money which will become available for spending for the recipient. But new elements makes their apparition : *Unlock parameters* and *locking conditions* of the money placed in this transaction. In practice, this change is simple. The transaction is now of the form of *Input* -> *Unlock* -> *Output lock*. The form a transaction is like the following :

```
ISSUERS: List of identifiers of the signers of this transaction
INPUTS: List of source transaction, to which the signers must be the owners
UNLOCKS : List of unlock paremeters of the inputs
OUTPUTS: Locking conditions of the money
SIGNATURES
```

2 types of locks are possibles.

* A lock **SIG(PUBKEY)** which means *The signature of PUBKEY is necessary to use this money*.

* A second lock is **XHX(HASH)**, which means *X number generating HASH is necessary to use this money*.

These locks can be combined with operators **OR** and **AND**. Finally, it is possible to place a temporal lock **LOCKTIME** on a transaction. This lock prevents a transaction from being written in the blockchain before a fixed time.
## Some examples of the new possibilities

Our simple transaction of 0.1 protocol transforms into a new form. To send money to public key **A** we place a locking condition **SIG(A°** meaning *Transaction has to be signed by pubkey A for this money to be unlocked*.

To send money to a pubkey **A**, while retaining control of the time it will be spendable, we will use a lock **XHX(HASH)** combined with a **SIG(A)**. We will choose a number **X** which, hashed, will generate the **HASH**. We will give this number **X** to **A** only when we will want him to be able to spend his money, for example when he did do his part of a contract.

We can also consider to implement *consumable* bills. A bill will be locked on a money consumable only by a secret number hidden in the bill. Physical destruction of the bill will reveal the number and let one get the money. A lot of physical destruction means are possible, like tickets to scratch, a chemical revealer, etc.

These are only first ideas we had while discussing between us. These new protocol rules will allow a lot of new systems to be developed, always more decentralized. The developers only need to appropriate these new means and develop new applications, for individuals to become always more free !

Article redacted by [@Inso](https://twitter.com/_inso), uCoin contributor and founder of Sakia client 
