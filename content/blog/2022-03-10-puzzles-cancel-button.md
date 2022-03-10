---
title: The puzzle of the cancel button
date: 2022-03-10
tags: [ "android", "security" ]
---

Regular readers will know I'm responsible for [the Android port of Simon Tatham's Puzzles](/projects/android-puzzles/), and that it's been a few years since I updated it. I've just discovered a dilemma that will unfortunately complicate the process further.

<!--more-->

![Spinny dialog waiting while a new game is generated](/images/20220310-generating-game.png?classes=foo)

The Puzzles codebase is a wonderful thing, providing remarkable flexibility of board sizes, difficulties, and variants of the 40 different games in the collection. In many cases it works by generating a random board, running a solver against it to assess the difficulty, and repeating until the difficulty is as desired. This is often slightly slow, and changing the settings can easily make it unbearably slow, leaving the user staring at a spinner (since we can't know how many more generation attempts will be needed). It's natural to want a Cancel button in this situation.

Unfortunately, that code was written in a simpler time, when long uninterruptible tasks were less frowned-upon than today. It is thousands of lines of C with complex memory management and no cancellation checks, and I am never going to have time to safely change that myself. This left the Android port with a problem: how to provide the Cancel button?

The solution until now was to build a separate binary, `puzzles-gen`, that runs as its own process, generating a game and outputting the resulting game state. That way, the Cancel button can just kill that process. The system doesn't then claim that the app has crashed, nor leave the generator running eating CPU and then complain about battery usage - either of which might happen under other methods of isolation.

The problem comes in a behaviour restriction applied to any new update now: [exec() from the app's home directory is no longer allowed](https://developer.android.com/about/versions/10/behavior-changes-10#execute-permission), i.e. you can't unpack this executable asset there and then run it. I understand the security benefits of this change; unfortunately it seems to rule out this separate process approach. The relevant code does also exist in my JNI library (alongside all the gameplay code) which the system will have already unpacked somewhere, but I seem to recall I already tried putting a `main()` function in the library and executing it, and there was some very good reason that didn't work, which I currently forget.

So even if I give up on having a Cancel button, probably game generation has to come back into a normal Android process (main or [separate](https://developer.android.com/guide/topics/manifest/service-element.html#proc)), which will be a bit fiddly.

New ideas for this would be very welcome. Here's my [Stack Overflow question from 2015](https://stackoverflow.com/q/31440067/6540) about it, still sadly lacking in answers other than my own.
