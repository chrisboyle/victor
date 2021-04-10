---
title: Lock on unplug
date: 2010-06-23
tags: [ "android", "hack" ]
---

Here's a hack for Gnome (vaguely relevant to Android too) that I've been using for a little while. When I get up from a computer, I generally want to lock the screensaver. I also pick up my phone from a USB dock (not the Nexus One Desktop Dock; that doesn't connect to a computer). So why not have the screensaver lock automatically when the phone disappears from USB?

<!--more-->

This is helpful when you're hurriedly picking up the phone to answer a call, and might otherwise forget to lock the screen. Of course, if you get a lot of calls that you want to answer while looking at your computer, this is not for you. :-)

This is pretty easy to achieve using udev. First we ask udev to run a script when this device disappears. The following goes in `/etc/udev/rules.d/51-android.rules` (or a similar name; the number is used for ordering). While I'm at it, I'll set sensible permissions and group ownership, using the first line.

```bash
# Set mode and group for (some) devices made by HTC
SUBSYSTEM=="usb", ATTRS{idVendor}=="18d1", MODE="0660", GROUP="mygroup"
# Nexus One without debugging enabled
SUBSYSTEM=="usb", ATTRS{idVendor}=="18d1", ATTRS{idProduct}=="4e11", \
  ATTRS{serial}=="HT123P456789", ENV{IS_MY_PHONE}="yes"
# Nexus One with debugging enabled
SUBSYSTEM=="usb", ATTRS{idVendor}=="18d1", ATTRS{idProduct}=="4e12", \
  ATTRS{serial}=="HT123P456789", ENV{IS_MY_PHONE}="yes"
# You could unlock on connect if you want:
#ENV{IS_MY_PHONE}=="yes", ACTION=="add", RUN+="/somewhere/unlock"
# Lock when my phone goes away
ENV{IS_MY_PHONE}=="yes", ACTION=="remove", RUN+="/somewhere/lock"
```

- The device doesn't have to be a Nexus One or a phone at all, run lsusb to find youridVendor/idProduct values (for Android, this may differ when you turn on/off USB debugging).
- To find your device's serial number, run sudo lsusb -v and look for iSerial (or run adb devices if you already set that up).
- Pick somewhere to put the lock script referenced in the last line.
- The contents of that script should be:
  ```bash
  #!/bin/sh
  exec su user -c ". /home/user/.dbus/session-bus/*-0; \
  export DBUS_SESSION_BUS_ADDRESS; \
  gnome-screensaver-command --lock"
  ```

The unlock script would be the same with `--deactivate`. Replace `user` with your username, and if your display isn't `:0` then you might need to do something smarter to get the right session bus. Oh, and I'm on Ubuntu Karmic (9.10); adjustments may be required for other environments. When you've done all that, run `sudo reload udev` to pick up the changes, unplug the phone, and watch the screen fade to black.

Question: how easy is it to fake a serial number of a USB device? Equivalently, how silly is it to have the unlock line uncommented? I'm guessing fairly easy.


