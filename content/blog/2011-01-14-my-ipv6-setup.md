---
title: My IPv6 setup
date: 2011-01-14
tags: [ "hack", "ipv6" ]
---

For my latest ugly hack, I wanted to give any/every machine in the house a globally-routable IPv6 address, and I didn't want to have to babysit the setup every time the router's IPv4 address changed.

<!--more-->

I actually already had [6to4](https://en.wikipedia.org/wiki/6to4) up and running on one machine (but failing these two requirements) since [this post a couple of years ago](https://shortcipher.insanejournal.com/70577.html). To extend it, I've borrowed heavily from [Michael Wensley's howto](https://www.wensley.org.uk/ipv6), but used a different approach which I find more readable. (Danger, automatic modification of config files ahead…)

The idea here is for one machine on your network to set up a tunnel to your nearest 6to4 relay, thereby receiving an IPv6 prefix of the form `2002:wwxx:yyzz::/48`, which it can then share among the other hosts by autoconfiguration using `radvd`. The machine on which you do this doesn't have to be your router, but it will be the gateway for all IPv6 traffic, so pick something that's usually powered on. Don't pick a machine on which you want to run [Steam](https://steampowered.com/), because you'll want it to be the router's DMZ destination, and [Steam bizarrely refuses to run in a DMZ](https://www.google.com/search?q=Steam+DMZ). It also doesn't tell you that this is the problem. Yes, I did find this out the hard way. :-)

Having chosen a machine, add something like [this tun6to4 stanza](/downloads/tun6to4-stanza.txt) in `/etc/interfaces`, but replace `abc` with the internal address of this machine, and replace both instances of `wwxx:yyzz` with your router's current external IPv4 address, in hex. A quick converter:

```bash
echo 11.22.33.44 |sed 's/\./ /g' |xargs printf %02x%02x:%02x%02x\\n
```

Before bringing that interface up, be sure this machine has a firewall for both IPv4 and IPv6, because you're about to have some shiny new globally reachable attack surface of your very own. :-) This should involve

```bash
ip6tables -P INPUT DROP; ip6tables -P FORWARD DROP
```

(or words to that effect) and poking holes as needed. There must be far better examples around, but [this is the general idea](/download/rc.local.firewall). When you're ready, set your router's DMZ setting (or whatever it calls the machine to which to pass inbound traffic by default) to this machine. You actually only need IP protocol 41, but I don't expect any home router can be that specific. :-) Run `ifup tun6to4`. You can now try `ping6 ipv6.google.com` (or browsing there).

Sharing the fun with the rest of the house isn't any harder: `apt-get install radvd` and use this [`/etc/radvd.conf`](/download/radvd.conf) or something similar (replace `wwxx:yyzz` again). When you restart `radvd`, machines should begin to acquire IPv6 addresses in this subnet. If not, see what they say to `sysctl -a |grep accept_ra` and `dmesg`. Note that my firewall example above deliberately prevents inbound traffic to them until you add something like the commented `FORWARD` line.

Now for the ugly hack to update all of this. It's quite simple, just substituting the prefix as necessary. You'll need to edit it for your particular router; you may need to authenticate and might not find the IP at its root URL for example. Your firewall arrangements may also differ. Here it is: [update6to4.sh](/download/update6to4.sh), and you'll want to add this to `/etc/crontab`, perhaps every few minutes (if the IP hasn't changed, it exits without writing anything).

Happy hacking. :-)
