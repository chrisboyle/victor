---
title: Android keymaps
date: 2010-08-22
tags: [ "android", "hack" ]
---

I recently bought a Bluetooth keyboard to use on Android; unfortunately some keys weren't recognised at all and others weren't quite mapped as I'd like. This is fairly easy to fix as an end user, as long as you have a rooted device (`adb remount` must succeed). **Update:** this is less likely now than in 2010. Here's a quick howto anyway, since I couldn't find one.

<!--more-->

It shouldn't need saying, but you do this at your own risk. You can easily break your device's response to keys, and possibly make your device unbootable too if the file is invalid.

It's pretty much as described under [Keymaps and Keyboard Input](https://source.android.com/devices/input) in the porting documentation. What we're going to do is edit one file: `/system/usr/keylayout/qwerty.kl`. This file maps [scancodes](https://en.wikipedia.org/wiki/Scancode) to [Android keycodes](https://developer.android.com/reference/android/view/KeyEvent.html). For example: `key 30 A` means scancode 30 (decimal) maps to `KEYCODE_A` (29), the A key. As the porting docs say, a separate Key Character Map file deals with what characters, if any (e.g. "a", "A", "#"), should be generated given the keycode and the state of the modifiers (Shift, Fn/Sym, etc). A different KCM can be loaded for Bluetooth keyboards depending on their device name, but at least by default, the same key layout file (including your changes) is used for Bluetooth and the built-in keyboard (if any).

So, first we need to fetch your current key layout, and it's a good idea to keep backups (both on the device and locally).

```bash
adb pull /system/usr/keylayout/qwerty.kl qwerty.kl
cp qwerty.kl qwerty-orig.kl
adb shell cp /system/usr/keylayout/qwerty.kl /sdcard/qwerty-orig.kl
```

Now, edit `qwerty.kl` as you like. It should look initially look similar to [this Nexus One example](http://android.git.kernel.org/?p=device/htc/passion-common.git;a=blob_plain;f=mahimahi-keypad.kl;hb=HEAD). You might find it helpful at this point to see what scancodes your keyboard is sending. There really ought to be a tool for this in Dev Tools or Spare Parts, but it seems there isn't. I've made a [dirt-simple app](https://github.com/chrisboyle/keytest/downloads) to show you [KeyEvent.toString()](https://developer.android.com/reference/android/view/KeyEvent.html#toString()), which was the work of 5 minutes and could certainly be improved.

My particular keyboard is a white roll-up 87-key variety, that you can still [find on eBay](https://shop.ebay.co.uk/?_nkw=silicone+bluetooth+keyboard&_sacat=See-All-Categories). It has F-keys doubling as media keys: if you get this model, be aware that the Fn key is really F-lock (toggles the state rather than acting as a modifier). Here is [my layout file](/downloads/bluetooth-keyboard-layout.txt) in case it's helpful. This layout mostly follows the principle of least surprise, except that the button with "Home" printed on it is Call, to mirror "End" being Hangup. F1 with F-lock on (Home symbol) is the Android "Home" keycode (goes to the home screen).

Now copy the layout back onto the device:

```bash
adb remount
adb push qwerty.kl /system/usr/keylayout/qwerty.kl
```

(If the remount fails, you probably don't have a rooted device.) It seems you need to reboot for the changes to take effect, so go ahead and do that, and your keys should then behave as you've specified. :-)
