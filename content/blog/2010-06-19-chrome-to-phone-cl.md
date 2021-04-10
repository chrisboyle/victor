---
title: Chrome to Phone CL
date: 2010-06-19
tags: [ "android", "hack" ]
---

A couple of recent Google offerings gave me an idea. First there was the demo of [cloud-to-device messaging at Google I/O](https://www.youtube.com/watch?v=IY3U2GXhz44), with which I look forward to seeing the Android development community do great things, and to demonstrate it they used a Chrome extension, [Chrome to Phone](https://code.google.com/p/chrometophone/). Then yesterday, [GoogleCL](https://code.google.com/p/googlecl/) appeared, providing access to several Google services from the command-line.

<!--more-->

Chrome to Phone is very nice, but it needn't be limited to just a browser button. Looking at the [source of their Chrome extension](https://code.google.com/archive/p/chrometophone/source), it's actually pretty easy to wire up as a bash script that just POSTs to the same backend. It should go without saying that this is a horrible hack, and if you write an app around this without first asking someone at Google, they'll probably block it. The approved way to push events to Android is to sign up for the [C2DM beta](https://code.google.com/android/c2dm/) with your own app. But if you want to play around with what's possible, or just cause your phone to open URLs from the command-line of your own machine, and your phone is running Froyo (Android 2.2), here's how:

1. [Get Chrome to Phone working as designed](https://code.google.com/p/chrometophone/wiki/SetupInstructions), as a Chrome extension.
1. Extract the SACSID cookie for chrometophone.appspot.com: Spanner, Options, Under the Bonnet, Content settings, Cookies, Show cookies, search for chrometophone, click on SACSID, and on the long string next to Content, right-click, Select All, Copy.
1. `apt-get install libnotify-bin` if you want notification of the result.
1. Use a script like this one:
```bash
#!/bin/sh
u=`echo "$@" |sed -e 's/^market:\/\//http:\/\/market.android.com\//' \
  |sed -e 's/&/%26/g'`
r=`curl -d "title=&url=$u&sel=" -H 'Cookie: SACSID=...your cookie here...' \
  -H 'X-Extension: true' 'https://chrometophone.appspot.com/send?ver=3'`
cd /usr/share/icons/gnome/scalable/status
case "$r" in
  *OK*) notify-send --icon=dialog-information.svg "$r" ;;
  *) notify-send --icon=dialog-warning.svg "$r" ;;
esac
```
Now you can give your script a URL, and your phone will open it. Note that the cookie might be IP-address-specific, in which case you'd need to redo the steps above to get it to work from a different IP. That fixup of market:// URLs means you can also register this script as the handler for them in GNOME…

```bash
gconftool-2 --set --type=string /desktop/gnome/url-handlers/market/command \
  "/your/script/here \"%s\""
gconftool-2 --set --type=bool /desktop/gnome/url-handlers/market/enabled true
```

…and then the next time you see in a desktop browser that some idiot has created a page with a market:// link on it, you can click it and your phone will open the relevant Market listing.
