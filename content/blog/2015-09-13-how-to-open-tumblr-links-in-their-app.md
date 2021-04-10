---
title: How to open Tumblr links in their app
date: 2015-09-13
tags: [ "android", "hack", "java" ]
---

Do you have Tumblr's Android app? Are you annoyed that links to Tumblr posts nevertheless open in a browser, whereupon they nag you to use their app?

**UPDATE: Some time in March(?) 2016, the Tumblr app itself started offering to handle URLs of Tumblr posts. Unfortunately it seems to only open the relevant blog showing most recent posts, not the post that was linked to. The same problem now manifests when I open a post via my redirector. So the redirector is no longer helpful and I do not recommend using it.**

Original post below for posterity / developer interest.

---

Short answer: [install this](https://github.com/chrisboyle/tumblrredirector/releases) until they fix it (I have asked them to). Longer answer: here's how to solve the next similar problem yourself with [Android Studio](https://developer.android.com/studio) and some basic knowledge of [Intents and intent-filters](https://developer.android.com/guide/components/intents-filters.html).

Aside: I actually wrote the fix in [AIDE](https://play.google.com/store/apps/details?id=com.aide.ui) (£7.75 for non-trivial features) using only my phone, and just tidied it up in Studio.

So, the problem we have is that when you click on a link like `http://shortcipher.tumblr.com/post/123.../title`, depending on your settings, you'll either go directly to a browser or you'll get an "Open with" choice in which the Tumblr app is not listed. The reason is simply that the Tumblr app hasn't declared itself capable of opening such URLs in its `AndroidManifest.xml`. But when you open a post in a mobile browser and look at the top of the page, there's a big "Open in app" button. So how does that button work? It links to a different URI which the app does handle:

```text
tumblr://x-callback-url/blog?blogName=shortcipher&page=permalink&postID=123...#_=_
```

The fix, then, is to make the world's simplest app, that does what Tumblr should have done and declares itself capable of opening the ordinary http:// URL, and when it gets one it'll just launch the tumblr:// URL and exit. To do this, create a new Android project in your preferred tool, starting with a blank Activity if given the choice, then set up [AndroidManifest.xml](https://github.com/chrisboyle/tumblrredirector/blob/master/app/src/main/AndroidManifest.xml): remove the original intent-filter with action MAIN and category LAUNCHER, which provides an icon in the app drawer, which we don't want. Instead, add this one:

```xml
<intent-filter>
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.BROWSABLE" />
    <category android:name="android.intent.category.DEFAULT" />
    <data android:scheme="http" android:host="*.tumblr.com" android:pathPattern="/post/.*" />
    <data android:scheme="https" android:host="*.tumblr.com" android:pathPattern="/post/.*" />
</intent-filter>
```

This just says the Activity is a way to open URLs with the given host and path and it's [safe to use from the browser](https://developer.android.com/reference/android/content/Intent.html#CATEGORY_BROWSABLE). Note that this doesn't handle links to a whole blog, which you could do by dropping the path pattern, but then you'd catch everything on www.tumblr.com as well and you'd have to work out whether some of those should still open in a browser.

You should also set android:theme="@android:style/Theme.NoDisplay" and android:stateNotNeeded="true" on the activity for a quick and seamless visual transition to Tumblr without displaying any UI of our own. Then in [the activity's Java source](https://github.com/chrisboyle/tumblrredirector/blob/master/app/src/main/java/name/boyle/chris/tumblrredirector/MainActivity.java) (abridged below):

```java
final Uri uri = getIntent().getData();
final String user = uri.getHost().substring(0, uri.getHost().indexOf('.'));
final String postId = uri.getPathSegments().get(1);
Intent i = new Intent(Intent.ACTION_VIEW, Uri.parse(
    String.format(getString(R.string.tumblr_app_uri), user, postId)));
i.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
startActivity(i);
finish();
```

This extracts the username and post ID from the URL, fills in the [new URI string](https://github.com/chrisboyle/tumblrredirector/blob/master/app/src/main/res/values/strings.xml), launches that and exits. Try it out! The first time around you'll need to choose the app and click "Always"; on subsequent occasions clicking a link to a post should Just Work.

As you'll soon discover if you look through Google Play's terms, publishing something like this is a thorny issue, likely to result in an argument with them about whether you're impersonating Tumblr and what your content rating should be. It seemed safer to just publish [an APK](https://github.com/chrisboyle/tumblrredirector/releases), which people can install almost as easily, though it does require ticking a box to acknowledge that you're installing something Google hasn't vetted. In any case, hopefully Tumblr will fix this properly soon.
