---
title: Puzzles updates
date: 2011-08-31
tags: [ "android" ]
---

Over the bank holiday weekend I found time for some maintenance on [the Android port of Simon Tatham's Puzzles](/projects/android-puzzles/). For users, this mostly means a few interesting new grid types in Loopy now that I've caught up with upstream. As always, you can update on Android Market, or manually on the project website.

<!--more-->

Developers might find it more interesting: **you can now use Eclipse or Ant** to build and run the entire project out of the box (as in, immediately after a git clone, if you have the prerequisites installed), instead of the previous Perl/Makefile-based system. This gives you all of the debugging tools from Eclipse and the NDK, and the `ndk-gdb` script has already been worth the effort by itself. It also means I'm not using horrible unsupported methods to build the package…

The project is still **mostly in C**, and that won't change, but now that you can build and run it just like any other Android project, you really don't have to worry about that unless you're actually making a substantive change to the C code.

Anyone who would like to get involved can find all the gory details [on GitHub](https://github.com/chrisboyle/sgtpuzzles), specifically in the README file. That file and the issue tracker between them have plenty of ways you can lend a hand.
