---
title: ScanSnap iX100 + Android hotspot
date: 2018-12-01
tags: [ "android", "hack" ]
---

Here's a quick tip to make this mobile scanner more conveniently mobile.

<!--more-->

I just bought a [ScanSnap iX100](https://www.fujitsu.com/uk/products/computing/peripheral/scanners/scansnap/ix100/), largely on [David North's recommendation](https://www.dnorth.net/2018/11/23/my-paperless-life/), and I'm pretty happy with it. Basically it's a ~30x5x4 cm lump that eats paper and drops searchable PDFs directly into your favourite cloud service, without needing to touch a computer/phone (except for initial setup). For more on the what, the why, and the pros and cons, see David's post.

But wait, I thought, about 5 minutes after I started using it: if all it needs is wifi, I could use Android's hotspot functionality, couldn't I? Then I could scan things away from home, anywhere I have mobile signal, without faffing about with local wifi and the setup app again. I can imagine absolutely no situation in which I would want or need to do this, but that's not the point; it had to be done, initially to see if I could, and especially once I discovered that on the face of it I couldn't.

[Standard disclaimer: I've tried this once and it worked for me; I hope these instructions help you but am not responsible for anything bad that happens if you follow them.]

The apparent barrier to doing this is in the setup process, using the ScanSnap Cloud app: if you want to teach the scanner about a new access point, you first need to have the access point and the app on different devices, and then your access point needs to [allow the app and the scanner to talk directly to each other](http://www.fujitsu.com/img/IMAGE/ssfaq/ix100/wifi/07_MR_connect.pdf), not just via the internet. Android's hotspot functionailty does not allow this, at least not on the stock OnePlus 5T that I tried.

A way to solve both those problems is to temporarily use a laptop or other non-Android device to host a hotspot with the same network-name and password as your Android device will later accept. Then add it as you would any other access point (ScanSnap Cloud, "Add wireless access point/router", select the scanner, enter your ScanSnap account password, go through the turn-it-on-holding-down-a-button routine, select the scanner from the list of wifi networks (this caught me out more than once), then select the wifi network you actually want). It's during the last stage of this process that the app and the scanner want to talk to each other over the newly-configured network for some reason. You should eventually see the button light up purple. If the devices can't talk directly in this way, it'll stay blue and the app will show an error.

You can now swap which device is providing that network and it shouldn't care: turn off the scanner, turn off the temporary hotspot, turn on the hotspot switch on your phone, turn on the scanner. If your hotspot notification says "1 device connected" and you get as far as the button lighting up purple, it worked, and you can roam the land, scanning with wild abandon. Probably. Like I said, it appears to work for me.
