---
title: Locale pulse trackball plugin
apk: PTLP-2.apk
github: chrisboyle/ptlp
unlisted: true
---

On the Nexus One, there is a setting under Sound & Display: Pulse notification light. I wanted to set this differently in different environments, using [Locale](https://www.twofortyfouram.com/), so I wrote a plugin.

<!--more-->

The plugin is a standard Locale action, with a single toggle that will set the Pulse notification light system setting accordingly when the action is fired. The plugin makes no attempt to control detailed behaviour of the light; the hint shown below it is just what I have observed that the system setting does. Namely: when the setting is on, the light will flash about once every 8 seconds when the screen is off and there is an unseen notification. When the setting is off, the light will still flash once when a new notification arrives.

There is no published Android/Google API for this setting as far as I know. I determined the name of the system setting (`notification_light_pulse`) by inspecting my own device, to which I have root access. Accordingly, Google has every right to break this in a future update, but for now, I publish it in the hope that it will be useful.
