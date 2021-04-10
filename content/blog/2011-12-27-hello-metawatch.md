---
title: Hello, MetaWatch!
date: 2011-12-27
tags: [ "android", "hack", "metawatch" ]
---

> Far out in the uncharted backwaters of the unfashionable end of the Western Spiral arm of the Galaxy lies a small unregarded yellow sun. Orbiting this at a distance of roughly ninety-eight million miles is an utterly insignificant little blue-green planet whose ape-descended life forms are so amazingly primitive that they still think digital watches are a pretty neat idea.
>
> (Douglas Adams, [The Hitchhiker's Guide to the Galaxy](https://en.wikipedia.org/wiki/The_Hitchhiker%27s_Guide_to_the_Galaxy))

<!--more-->

Until quite recently, probably every 5 minutes on average, every waking hour, I would take my phone out of its holster (or wake it up, if docked) and glance at it, to make sure I hadn't missed any attempts to contact me. Frequently, I found I had: even with a belt holster, the phone's vibration is easy to miss. Now, I just look at my watch instead, and almost never miss any such notification in the first place: a watch vibrating is much more noticeable.

[![My watch, showing several Android notifications](/images/20111219-watch.jpg)](https://photos.app.goo.gl/Usi8q1FPsFw8pkmy6)

…so I never actually see the watch full of notifications like this. :-) The watch in question is a MetaWatch (digital), and I think it's a pretty neat idea. In contrast to previous smart watches I've seen, it's not trying to be much of a computer in its own right, just an add-on for an existing smartphone (or other Bluetooth device), providing an always-on, glanceable 96x96 LCD display and 6 buttons. The battery life is quite reasonable: about two days on mine, which I'm constantly messing with, some people report four days and five should be possible. It's built around a [TI MSP430](https://www.ti.com/product/MSP430F5438A) and you can modify the firmware if you want, but currently that requires non-free tools and, in any case, I find there's more fun to be had [hacking the supplied Android app](https://github.com/chrisboyle/MWM-for-Android) ("MetaWatch Manager" or MWM), where you have a net connection and the data on your phone to play with. The firmware defines a few modes: idle (showing the time), full-screen application and full-screen notification.

I've not seen anything else quite like this: the LiveView seems much less hackable, the inPulse has one button as its only form of input (why?!), the WIMM One (no detail there, so have [a review](https://www.theverge.com/2011/11/9/2546990/wimm-one-review)) is very shiny but is trying to be an independent smart device (running everything on the watch, with its own wifi connection) and is correspondingly more expensive, and all of the above seem like they'd have trouble achieving a four-day battery life.

I should mention at this point that it took a few heinous hacks in MWM and a modified build of Android to get to the photo above. The default UI out of the box is rather less information-dense:

[![MetaWatch showing weather in more detail, and large indicators for missed calls/SMS/emails](/images/20111226-watch-before.jpg)](https://photos.app.goo.gl/Usi8q1FPsFw8pkmy6)

I wanted to make better use of the pixels on mine. I suppose the stock layout does give you something pretty to show people in the absence of any notifications: mine is just the time, date and temperatures in that situation.

You can look through my [commits on GitHub](https://github.com/chrisboyle/MWM-for-Android/commits/master) to see what else I'm up to. Earlier today I mapped a button to act like a Bluetooth headset button: play/pause music and answer/hangup calls. I also finally got the [Remember The Milk API](http://rememberthemilk.com/services/api/) to cooperate, so I can press a button as I'm walking into the supermarket and see my shopping list on the watch. The next step would be a UI to flip through the items and mark them as completed.

I'm also looking to improve the UI on the phone screen: the settings screen is about 10 screenfuls long and should be split, and I think the main screen could be much more useful. Currently it's just a text dump of various bits of status, but what if it showed you the current watch display (a feature I liked in Cicada) and let you remap buttons using dropdowns? Something like this…

[![MetaWatch Manager with current watch display and possible button remapping UI](/images/20111226-mwm.png)](https://photos.app.goo.gl/Usi8q1FPsFw8pkmy6)

Food for thought, at least. Meanwhile, [quite a few others seem to be joining in](https://github.com/MetaWatchOpenProjects/MWM-for-Android-Gen1/network), a few [weird and wonderful projects](https://sites.google.com/site/metawatchdev/software/hacks) have been going for some time and the forums seem to have a friendly and helpful community of users and developers. I think I'm going to have fun with this. :-)
