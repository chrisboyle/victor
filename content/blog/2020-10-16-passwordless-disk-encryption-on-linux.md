---
title: Passwordless disk encryption on Linux
date: 2020-10-16
tags: [ "boot", "security" ]
---

My Linux installation is encrypted but boots without a password. Here's how that works.

<!--more-->

I just got a new PC! It's full of rainbow LEDs, and the hostname is bifrost: my rainbow bridge to the world. Also because I love The Mechanisms. I have Ubuntu for most things, and Windows for gaming, X-Plane, etc. New installations are a good time to get security set up properly, so I've been looking at Secure/Measured Boot and disk encryption. This is mainly going to be a link to [Kyle Rose's guide](https://www.krose.org/~krose/measured_boot), but here are some quick definitions and a bit more context of what I wanted:

- Secure Boot means your computer will only boot an appropriately signed bootloader, which in turn will only boot a signed OS kernel, and this chain can continue to modules/drivers and sometimes applications. It makes it harder for malware to stick around via modified boot files.
- Measured Boot means each link in that chain will feed checksums of what it's loading to a chip called a TPM, which can later be used to show that the boot process hasn't been altered since some earlier time. You can then give cryptographic proof of this to a remote server, but more interestingly for me, you can also use it to secure secrets. You tell the TPM "here's a secret, don't let anyone have this in future unless they've booted the same things as I just did".

For this single-user, personal, home machine, my main threat model is that eventually it gets stolen and someone decides it's worth trying to extract the data from it. So I want the disks to be encrypted, but it's also useful to me if the OS can safely boot as far as a login screen before requiring me to enter a password. I consider this safe enough if Secure Boot ensures it's running my unaltered installation with a decent login password. Windows 10 achieves this if you enable BitLocker, and I wanted the same on Linux.

![Flow chart of boot process from firmware to decrypting storage](/images/boot-layout.svg)

Time to utter the cursed words… "how hard can it be?" Not that hard, it turns out! I installed Ubuntu 20.04 via UEFI, chose encryption at the disk partitioning stage, and followed the prompts about Secure Boot. That gives you an OS that will boot with Secure Boot enabled and can sign modules for you (although e.g. initrd can be tampered with) and it prompts for a password to decrypt the disk. So the main thing to do from there is to put an extra LUKS key into the TPM, and set it up to be used automatically.

At this point [Kyle Rose's guide to measured boot setup](https://www.krose.org/~krose/measured_boot) contains all the heavy lifting code, and I won't repeat it all here, but there were some slight differences for me:

- Most significantly, I eventually didn't bother with the stub. I am satisfied that [GRUB's use of PCRs 8 and 9](https://www.gnu.org/software/grub/manual/grub/html_node/Measured-Boot.html) covers changes to initrd and commandline, having seen those values change. That is, an attacker can boot a different commandline from GRUB but would then not get a passwordless boot.
- [Password-protecting custom GRUB activity](https://www.gnu.org/software/grub/manual/grub/html_node/Authentication-and-authorisation.html#Authentication-and-authorisation) is a good extra line of defense anyway.
- I think these [UEFI PCR definitions](https://ladyitris.files.wordpress.com/2018/07/tpm-pcr-uefi.png) are more correct for me than the BIOS ones given. You can use up to 8, so I went with 0,1,2,4,7,8,9,14.
- My TPM, integrated into the Ryzen CPU, doesn't seem to need a kernel module so I don't need the `force_load` lines.
- I have a simple encrypted LUKS partition instead of LVM, which seems to work just as well.
- If you are going to use the stub anyway for some reason:
  - vmlinuz and initrd.img live in /boot on Ubuntu.
  - If your EFI boot menu is as annoying as mine (requires the firmware password), then instead of giving the stubbed kernel an EFI boot entry, you could keep GRUB and say chainloader /EFI/ubuntu/linuxstub.efi
  - Assuming you have Secure Boot enabled, you'll need to enroll an extra MOK without the module-only restriction and sign the stub as per these [instructions from linux-surface](https://github.com/jakeday/linux-surface/blob/master/SIGNING.md).

But otherwise, that's it, it seems to be working. This is the first time I've attempted this so there may be mistakes; corrections welcome.
