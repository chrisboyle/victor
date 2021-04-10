---
title: GnuPG, 4096-bit keys and OpenPGP cards
slug: gnupg-4096-bit-keys-openpgp
date: 2011-02-28
tags: [ "gnupg", "security" ]
---

I'm now the proud owner of a [Crypto Stick](https://www.crypto-stick.org/), an OpenPGP smartcard implementation in USB stick form. It is apparently capable of generating and using 4096-bit keys, but [GnuPG has a limit of 3072 bits](https://lists.gnupg.org/pipermail/gnupg-devel/2009-October/025412.html) (quick tests and git master show this is still the case).

<!--more-->

Fixing this doesn't sound that hard, from that message; I'll be taking a look at this when I get time and energy. Given my track record on getting time and energy to do such things, don't let that stop anyone else from working on it. :-)

Updates:
- Done (mostly), see https://lists.gnupg.org/pipermail/gnupg-devel/2011-March/026018.html
- It looks like last month Werner implemented this, and included it in gnupg 2.0.18. (I haven't tried it yet.)
  https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commit;h=fb44677c9f2cab6bac08d04d675554b38f64382a
