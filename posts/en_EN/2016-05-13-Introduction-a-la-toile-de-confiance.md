# Introducing members management

Duniter is a software which allowing the creation of a free money as described by the RTM (Relative Theory of Money). This theory implies that monetary units are co-produced by each of the members of a given community. It is therefore essential that the members of the community are identified and recognized.

In a word without dishonest people, a simple declaration of identity could be enough to become a member (and thus co-produce monetary units). But in our world, when it is about money, cheating cases can potentially come.

Actually, it is tempting to register with many identities and thus produce a surplus of monetary units for its own advantage. This is even more true when it is about digital identities and when it is easy to create as much as we wish. We call such a thing a *« sybil attack »*.

One should ensure sure that the members are disposing of only one digital identity.



## Who is to trust ?

How to ensure that the members are disposing of only one digital identity ? Which organization is necessary ?

There are two types of possible organization : the organizations with a trusted third-party, and the self-regulated organizations.

To illustrate the organization with a trusted third-party, let's take the example of population census. These is the administration of the state which « creates » the identities and registers them in different files (aka, data bases) of the state. These officials are acting like  « trusted third-party » in the name of the state. The control means used can be administrative documents (maternity declaration, proof of address, ...). These means are far from being foolproof since it is trivial to create fake documents (and then obtain real-fake papers). This system is based on the judiciary system to deter fraudulent behaviors.

To illustrate an auto-regulated organization, we can use the example of the queue area. People arrive one after the others, even if no one is really delighted to wait for his turn, each one respects the rule, which regulates a queue ; first-come, first-served. Given that everyone knows who came first and who came later, anyone is able to control that there is no cheating. To violate these rules expose us to a strong social disapproval, and an exclusion of the queue.



## Web of trust

Duniter makes the choice of a self-regulated system by its own members.

Let's not forget the goal which is to ensure that the individuals are able to register with only one digital identity.

The system distinguish two types of digital identities : the *member identities* and the *non-member identities*. Only the members identities are co-producers of money.

Any individual which is already a member is in capacity, thanks to a signed digital document, to certify identities (members and non-members). That is to deliver **certificates of authenticity**.

These certificates, given from ones to the others, makes a mesh called « **web of trust** ».  This web of trust is used by Duniter to determinate who is a member and who is not.

 <center>![Global Web of trust of the test money Meta Brozouf in June of 2015](https://moul.re/blog/data/medias/ucoin/wot_fmm5.png)</center>



## Operating rules of the web of trust

Rules governing the web of trust of a Duniter money is parametrized when the money is being created (initialized) by it's founders, and *cannot be modified later*. It is thus important to pay a particular attention to these parameters.

 **Self-declaration of a digital identity**

An individual, who whishes to become a member of a community, has to issue its digital identity.

On Duniter, a digital identity is composed of :

* a private cryptographic key, knew only by the individual and not    broadcasted to the network, is used to sign digital documents

* a public cryptographic key, knew be anyone, is used to check that a    document has been signed by the private key of the individual

* a pseudonym

The self-declaration of identity by itself is not enough to become a member but is the first step of the process.

As any identity card, a digital identity has an **expiration date**. If it is not renewed regularly, it becomes invalid.

In a money created with Duniter, the maximum validity duration of a member identity is configured with the parameters  *msValidity (Membership expiry Delay)*

**Certifications**



 To become a member, an individual must collect a given number of certifications from existing members. These certifications have an expiration date. To keep a member status, a digital identity must be continually re-certified by members.

The number of necessary certifications to become a member is configured by the parameter  *sigQty (Min Required Certs)*. The life expectancy of a certification is configured with the parameter  *sigValidity (Cert Expiry Delay)*.

**Anti-sybil protections**

Complementary rules are applied to ensure the safety of the web of trust against a group of attackers.

* The number of steps

A group of members could associate to create fake identities and certify them to let them become members. Even more, they could use these fake members to certify new fake identities, creating then a really big number of illegitimate members.

<center>![Sybil Network](https://framapic.org/qh2PZc9A2Unk/IDZe8MfG6yh0.jpg)</center>

 To prevent this attack, Duniter ensures that members are close enough one to the others in the web of trust. In the example below, the member C is two steps from A.

<center>![2 steps](https://framapic.org/4LNI8XX2JAJt/HY1s3QndhJS7.jpg)</center>

 When an individual is susceptible to become a member (that is, he obtained enough certifications), Duniter runs the following verification procotol :     

* Members who issued enough certifications are used as  « points of control    » (*sentries*).

The number of issued certifications depends of the number of current members. N is the number of members, Y(N) is the number of issued certifications required for the members to be considered  « point of control ».

```
N         Y(N)
10        2
100       4
1000      6
10000     8
100000    12
1000000   20
```

To become a member, the identity has to join a given percentage *xpercent* (Percent of distance) of the points of controls with a number of steps named *maxsteps* (Max distance).

 **Limiting the powers**

To protect against a massive creation of sybil members, the members are given a limited stock of signature. This stock is emptied when the member issue certifications, and fills when the certifications expire.

The stock of certifications is configured with the parameter *sigstock* (Max cert stock).

In addition, to stops an eventual attack, Duniter does not authorize a member to issue many certifications simultaneously. Duniter handles them one by one and apply a pause between each processing.

This period is configured with the parameter  *sigPeriod* (Delay between two certs).

 **Expiration of certifications while they are being treated**

A certification which has not been treated in a given time is destroyed. This happens when a member issue many signatures at the same time. Duniter apply a pause between each processing, the certifications which did not had the time to be treated are destroyed.

This delay is configured with the parameter *sigWindow* (Cert Time Window).

There is one similar parameter used when new members are registering.

As we saw previously, to become a member, an individual must :

* publish is declaration of identity

* collect a sufficient number of certifications

* respect the steps rule

These three steps must be realized in a window of time configured by *idtyWindow*.


