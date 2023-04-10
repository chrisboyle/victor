---
title: Controlling GRUB from the network
date: 2023-04-10
tags: [ "boot", "security" ]
---

I have a dual-boot machine, which I can wake up over the network. Here's how I added the ability to select which OS GRUB should boot over the network.

<!--more-->

The machine whose boot setup I [previously blogged about](/blog/2020/10/passwordless-disk-encryption-on-linux/) supports Wake on LAN, for example [via Home Assistant](https://www.home-assistant.io/integrations/wake_on_lan/). Sometimes I want to boot into Windows to play games, and it's useful to be able to start that process remotely. However, there aren't a whole lot of good options for telling GRUB to do that.

Here's what I want from this setup:

* Choose between two OSs, without necessarily allowing any further control.
* Especially don't entrust a remote host with further control over unauthenticated protocols.
* Keep Secure Boot and Measured Boot functioning properly (see earlier blog post).
* Boot normally if the network is unavailable for any reason.

I could in principle network-boot GRUB, perhaps two different versions of it, but that somewhat fails the last criteria. It could fallback to local boot, but the change of bootloader hashes would upset Bitlocker and my Linux-based equivalent.

GRUB has modules `http` and `tftp` that can read remote content, but there are two obstacles:

1. Those modules aren't included in Ubuntu's signed version (for security, I suppose?) - one can build a different image, although [beware SBAT](https://superuser.com/a/1778021/4211).
2. The only GRUB commands I can see that actually act on the contents of a remote file are those that load it as a config file or boot from it as a kernel, initrd, or executable. Those are rather more trusting actions than I wanted.

So my solution: create or remove a file on a TFTP server appropriately, and then:

```
set net_default_server=192.168.0.123
if cat (tftp)/file_that_sometimes_exists; then
  set default=Windows
fi
```

Note that this doesn't work with HTTP, because the retrieval of a 404 response body is somehow still considered successful as far as `cat` is concerned.

Better ideas welcome, but this seems to work.