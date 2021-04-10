---
title: Locale Bluetooth ACL condition
github: chrisboyle/bluetoothacl
unlisted: true
---

I wanted a Locale plug-in to detect Bluetooth connection/disconnection events instantly using the [`ACTION_ACL_CONNECTED`](https://developer.android.com/reference/android/bluetooth/BluetoothDevice.html#ACTION_ACL_CONNECTED) (and disconnected) intent broadcasts.

<!--more-->

Other bluetooth plug-ins I found seemed to poll, and the resulting lag annoyed me. I use this plug-in to detect when I'm driving, and enter car dock mode (including launching Car Home), set my Google Talk status, etc. - now this all happens a few seconds after I turn the ignition on (when the car kit connects to the phone), even if I haven't put the phone in the cradle yet.

The current code on GitHub works, but has no way to get the current connection state, it can only watch for changes. So if a device is already connected when the plug-in starts (you have just set it up, or you have just rebooted) then it won't be noticed until you disconnect and reconnect.
