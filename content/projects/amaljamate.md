---
title: Amaljamate
download: amaljamate-0.2.py
github: chrisboyle/amaljamate
tags: [ "python" ]
---

In order to reduce the number of sites I have to regularly visit to check for updates, I wanted a feed of my LiveJournal friends page (a date-sorted list of friends' recent entries), and the equivalents on InsaneJournal, Dreamwidth, etc. Unfortunately, those sites don't provide one.

<!--more-->

So I wrote a script to achieve the same thing. It's about 200 lines of Python, and when configured with your credentials for each site, it will look at your list of friends, retrieve the feed for each friend, and write the 100 most recent entries to the file you've specified, **which you should then make accessible to yourself only, using the authentication mechanisms of your favourite web server**.

N.B. In order not to annoy the site administrators, and to comply with the [policies on bots](https://www.livejournal.com/bots/), the script will sleep a few seconds between retrieving each resource. If errors occur, it will wait exponentially increasing amounts of time (up to 100 seconds) and retry. It is multithreaded, but with only one thread per site. Therefore, for me, running this script once takes 15 minutes. Running it immediately again will take only a few seconds, because everything will be cached. By default the cache is in the directory `~/.amaljamate-cache` and downloads are cached for about 58 minutes.

Here's one way you could set this up:

1. **Configure your web server to protect access to a particular directory. You MUST do this, otherwise everyone can read your friends' entries.** Here are the relevant documentation sections for Nginx, lighttpd and Apache 2.
1. `sudo apt-get install python-yaml` (or make that module available some other way).
1. Install `amaljamate.py` into `~example/bin`.
1. Write your `~example/.amaljamate.yml` file, remembering to `chmod` it appropriately:
    ```yaml
    livejournal.com:
      username: joebloggs
      password: letmein
      output: ~/www/secure/LJ.xml
      exclude: [some_crossposter, foo, joebloggs]
    dreamwidth.org:
      username: joe
      password: cloud9
      output: ~/www/protected/dreamwidth.feed
    ```
    There are more options that can be changed at the top of the script itself, including the group and permissions to set on the output files.
1. Set up cron to run the script regularly (crontab -e); this example runs every 2 hours on the hour:
    ```cron
    # m h dom mon dow command
    0 */2 * * * /home/example/bin/amaljamate.py
    ```
1. For the impatient, run the script manually once to avoid waiting for a first scheduled run.
1. Test that you can't access your new feed's URL without authentication. If you're publishing your friends' entries to anyone who comes looking, you may lose friends, and I don't just mean online. :-)
1. Enter your new feed's URL, **including authentication**, into a feed reader. **Do not attempt to use Google Reader for this**, as it does not understand the concept of private feeds, and could easily offer/suggest your feed to other people.
