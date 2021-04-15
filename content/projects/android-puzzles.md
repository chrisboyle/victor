---
title: Simon Tatham's Puzzles on Android
weight: 1
tags: [ "android", "c", "java" ]
playStore: name.boyle.chris.sgtpuzzles
apk: SGTPuzzles-2019-03-26-0844-68363231.apk
github: chrisboyle/sgtpuzzles
description: Simon Tatham's Puzzles, ported to Android. Free, no ads, playable offline. All games are generated on demand with adjustable size and difficulty, so you'll never run out of puzzles.
---

This is a port of [Simon Tatham's Portable Puzzle Collection](https://www.chiark.greenend.org.uk/~sgtatham/puzzles/), a collection of 39 single-player logic games. It's free, with no ads, and is playable offline. All games are generated on demand with adjustable size and difficulty, so you'll never run out of puzzles.

<!--more-->

[![Screenshot of list of puzzles, part 1](/images/puzzles-list-1.png)](/images/puzzles-list-1.png)
[![Screenshot of list of puzzles, part 2](/images/puzzles-list-2.png)](/images/puzzles-list-2.png)

I first played this collection on PalmOS, and enjoyed it so much that when I got the first Android phone in 2008, I ported it to Android so I could keep playing. You can't quite still use that first phone to play it, but I do try to keep the requirements as low as I can.

{{< playStore >}}

Got an Apple device? Try [Greg Hewgill's iOS version](https://hewgill.com/puzzles/). See [the original project](https://www.chiark.greenend.org.uk/~sgtatham/puzzles/) for lots of other ways to play, including in a web browser.

Bug reports, feature requests etc. for Android to puzzles@chris.boyle.name or directly into the [issue tracker](https://github.com/chrisboyle/sgtpuzzles/issues) at GitHub.

License: [MIT license](https://www.chiark.greenend.org.uk/~sgtatham/puzzles/doc/licence.html#licence) (same license as upstream). Note that this applies to the source as released on GitHub and excludes the extra graphics in the APK, both on the Play store and here. This is an attempt to keep the genuine app distinguishable from the clones full of ads.

### Want to beta test future versions?

[Opt in to testing](https://play.google.com/apps/testing/name.boyle.chris.sgtpuzzles) on Google Play.

There's nothing currently in beta, but if you opt in you will receive beta updates as and when they are published.

### Requirements to run

- Android 4.1 (Jelly Bean) or higher
- Permissions: read/write SD for saved games; NFC for Android Beam

### Requirements to compile

- [Android SDK](https://developer.android.com/studio)
- [Native Development Kit](https://developer.android.com/ndk)
