---
title: Locale power source plugin
github: chrisboyle/pslp
apk: PSLP-4.apk
unlisted: true
---

This is a quick hack to let [Locale](https://www.twofortyfouram.com/) detect whether an Android device is plugged into USB or some other power source. Requires Android 2.2+.

<!--more-->

I wrote it because I wanted to detect my car holder, which is the only place I charge my device that is not USB. Perhaps someone else will find it useful. If you want to be more specific than the "AC/dock" option, there are at least two plugins from other people that detect docks.

For reference, here is the [BatteryManager API](https://developer.android.com/reference/android/os/BatteryManager.html#EXTRA_PLUGGED) I'm using. Notice how there are only values defined for battery, AC (which includes other non-USB power sources), USB, and wireless. I've not seen other values from any kind of dock; there's a separate API for docks.

If you're using [Tasker](https://tasker.joaoapps.com/) instead of Locale, you don't need this; it's built-in.
