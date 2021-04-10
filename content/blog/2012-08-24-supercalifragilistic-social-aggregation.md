---
title: Supercalifragilistic-social-aggregation
date: 2012-08-24
tags: [ "android" ]
---

Back in March, I [complained about a crowded notification drawer](/blog/2012/03/android-foreground-service-notifications), and hey, look, [they fixed it](https://developer.android.com/reference/android/app/Notification.html#PRIORITY_MIN). (Even if any given app isn't on board with this yet, hello [apktool](https://ibotpeaches.github.io/Apktool/)/[baksmali](https://github.com/JesusFreke/smali), bye bye notification icon.) So, clearly I should complain more often. :-)

<!--more-->

In that spirit, then, a question to app authors, including myself: why do my phone and I need to check so many different places for news from my friends and blogs? It's polling these all day. (All night too, which is silly, as I'm asleep.)

| Interval | Service | App | Notes |
|-|-|-|-|
| 15 mins | Twitter | [Twicca](https://play.google.com/store/apps/details?id=jp.r246.twicca) | timeline, replies, DMs |
| 1 hour | LJ etc. | [RssDemon](https://play.google.com/store/apps/details?id=com.meecel.RssDemonElite) | 3 private Atom feeds from [Amaljamate](/projects/amaljamate/) |
| 1 hour | various | [RssDemon](https://play.google.com/store/apps/details?id=com.meecel.RssDemonElite) | 58 public RSS/Atom feeds |
| 6 hours | Facebook | [HaxSync](https://play.google.com/store/apps/details?id=org.mots.haxsync) | shows up on contacts only, see below |
| 1 day | Google&nbsp;Play | Andlytics | download stats for [Puzzles](/projects/android-puzzles/) etc. |
| push | IMAP | [K-9 Mail](https://play.google.com/store/apps/details?id=com.fsck.k9) | |
| push | * | [Google Cloud Messaging](https://developers.google.com/cloud-messaging) | most Google services, Remember The Milk, Songkick, Dropbox, IMDb, etc. |

RSS in particular: my phone really doesn't need to poll 60 different hosts. Google Reader is an incomplete solution, because it doesn't understand private/authenticated feeds, but does show that an aggregation server can make this much less painful, for apps that can afford one. As well as the aggregation, this allows better update schedules: push anything important (replies/messages addressed specifically to me), use a slow inexact alarm to get the rest. More details here: [Minimizing the Effect of Regular Updates](https://developer.android.com/training/efficient-downloads/regular_updates.html). Many apps, individually, already do these things. The ones that don't mostly should.

But I also want to aggregate things from a UI point of view. Strangely enough, I don't actually like checking an ever-increasing number of apps/websites any more than my phone's battery does - and I often have disconnected views of it on my phone versus other devices. My ideal is a single news stream: tweets, blog posts, news, the lot, viewable on the web (my own server) or Android, with the aforementioned sync strategy, including read/unread.

Android allows all this today, and the [social stuff in 4.0.3](https://android-developers.googleblog.com/2012/02/new-social-apis-in-android-ics.html) might be a good, well-integrated foundation, but it's still intended only as a preview, not a replacement of a service's own app. The spanners in the works are social sites who don't like being aggregated, in particular Twitter and Facebook. Twitter is preparing to kill off "consumer"-facing clients, but, happily, many users seem prepared to move away from Twitter as a result. The less said about app.net the better, but Tent looks interesting.

Facebook's a harder problem: many of my friends rightly distrust all Facebook apps and [opt out of the "platform"](https://www.facebook.com/help/211829542181913?faq=211829542181913#-How-do-I-turn-off-Platform-apps-and-websites?), meaning their posts can only be seen in the browser (or possibly Facebook's own app, which I won't install because it'll run off home with my contacts database). Result: I reluctantly check the site occasionally because of people who post nowhere else, and will eventually get around to leaving when there are few enough such people. They don't seem keen to move any time soon, and I can somewhat understand that, because there aren't many good places to jump to. Most of the alternatives lack features, and all of them lack users (some of them deliberately exclude users - looking at you, G+/#nymwars).

For many people, they already have their single stream of everything. It's called Facebook. And they don't care that their posts are locked in. Yet. I can only hope that some other site gets popular enough that people are prepared to cross-post (Facebook, for the moment, remains receptive to importing content). Then, eventually, I no longer need to care about Facebook. The hard part, obviously, is for any other site to get popular enough.
