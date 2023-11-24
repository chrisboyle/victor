---
title: Simon Tatham's Puzzles on Android
weight: 1
tags: [ "android", "c", "java" ]
playStore: name.boyle.chris.sgtpuzzles
apk: SGTPuzzles-2023-11-15-2237-96d65e85.apk
github: chrisboyle/sgtpuzzles
description: Simon Tatham's Puzzles, ported to Android. Free, no ads, playable offline. All games are generated on demand with adjustable size and difficulty, so you'll never run out of puzzles.
---

This is a port of [Simon Tatham's Portable Puzzle Collection](https://www.chiark.greenend.org.uk/~sgtatham/puzzles/), a collection of 40 single-player logic games. It's free, with no ads, and is playable offline. All games are generated on demand with adjustable size and difficulty, so you'll never run out of puzzles.

<!--more-->

[![Screenshot of Net](/images/01_net_1650995906116.png)](/images/01_net_1650995906116.png)
[![Screenshot of Solo](/images/02_solo_1650995906441.png)](/images/02_solo_1650995906441.png)
[![Screenshot of Mosaic](/images/03_mosaic_1650995906773.png)](/images/03_mosaic_1650995906773.png)
[![Screenshot of game chooser](/images/08_chooser_grid_1650995905261.png)](/images/08_chooser_grid_1650995905261.png)

I first played this collection on PalmOS, and enjoyed it so much that when I got the first Android phone in 2008, I ported it to Android so I could keep playing. You can't quite still use that first phone to play it, but I do try to keep the requirements as low as I can.

{{< playStore >}}

Got an Apple device? Try [Greg Hewgill's iOS version](https://hewgill.com/puzzles/). See [the original project](https://www.chiark.greenend.org.uk/~sgtatham/puzzles/) for lots of other ways to play, including in a web browser.

Bug reports, feature requests etc. for Android to puzzles@chris.boyle.name or directly into the [issue tracker](https://github.com/chrisboyle/sgtpuzzles/issues) at GitHub.

License: [MIT license](https://www.chiark.greenend.org.uk/~sgtatham/puzzles/doc/licence.html#licence) (same license as upstream). Note that this applies to the source as released on GitHub and excludes the extra graphics in the APK, both on the Play store and here. This is an attempt to keep the genuine app distinguishable from the clones full of ads.

### Want to beta test future versions?

[Opt in to testing](https://play.google.com/apps/testing/name.boyle.chris.sgtpuzzles) on Google Play.

This will give you automatic beta updates as and when they are published. Alternatively you can find beta APKs [on the GitHub releases page](https://github.com/chrisboyle/sgtpuzzles/releases).

### Requirements to run

- Android 4.4 (KitKat) or higher
- Permissions: none! (Load/Save is now handled via the Storage Access Framework only)
- Pre-2022 versions need 4.1 or higher, SD/storage permission for load/save, and NFC permission for Android Beam.

### Requirements to compile

- [Android SDK](https://developer.android.com/studio)
- [Native Development Kit](https://developer.android.com/ndk)
