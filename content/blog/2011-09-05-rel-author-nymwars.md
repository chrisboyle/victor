---
title: Thoughts on rel=author, \#nymwars, "identity service"
slug: rel-author-nymwars
date: 2011-09-05
tags: [ "gplus", "identity", "nymwars" ]
---

Over the past month or so, the "nymwars" have become the thing Google+ is most known for among my circle of friends. This is a problem of Google's own making: they are suspending profiles based on naive heuristics about "real names" (actually typical two part western names), and demanding government ID to reinstate them.

<!--more-->

The names policy they claim to be enforcing says you should use the name your friends, family or co-workers usually call you, but it is both possible and common for this to be entirely different from the name the government calls you. Furthermore, the verifiers apparently lack even basic training in ID verification, which allows [frivolous reporting of profiles and trivial reinstatement for the true trolls/imposters](https://gewalker.blogspot.com/2011/08/firsthand-examination-of-google-profile.html) (who will think nothing of faking an ID).

### Why are they bothering?

This is [not an effective defence against trolls](https://www.theguardian.com/technology/2007/jul/12/guardianweeklytechnologysection.privacy) as was initially claimed; they're more concerned with ideas about G+ as an "identity service" and a way to "improve our products" than about the wishes of their users or the fact that they're perpetuating the exclusion of minorities. I realise they are a business, but this is markedly worse than anything I've previously seen from them, it has directly affected and excluded several of my dearest friends, and when a player this big gets it this wrong, it's all the more important to hold them to account. This will be difficult, because apparently they are committed enough to their current course of action to ignore the wrath of numerous developers and employees, and to spend substantial extra resources employing an army of ID verifiers. This from Google, who famously don't do support because it doesn't scale.

### "Improving our products": the Tentacles of Doom

This isn't just about being excluded from the latest trendy Facebook replacement. The first "identity service"-related feature went live before G+ did (using old-style Google profiles), and means connecting your content elsewhere on the web to a Google profile will make that content more eye-catching (even if no higher up) in search results, with a head shot and author name.

![Google search results with author photos](/images/20110904-authors.png)

I would be very interested to hear what competition regulators have to say about this use of a dominant position in search to bribe people onto an "identity service", ostensibly a different product in which Google is still far from a market leader. They don't appear to offer this for any profile/identity pages but their own. This is something I intend to ask the [Open Rights Group](https://www.openrightsgroup.org/) about, and it may be worth someone's while to make an [EU competition complaint](https://ec.europa.eu/competition/consumers/contacts_en.html), as it seems superficially similar to cases in which the EU has acted against Microsoft in the past (use of dominance in the OS market to get into the media player software market).

### Zen and the art of identity maintenance

I want to explicitly call out the dependency that Google is encouraging people to introduce by using them as an "identity service". If you already don't want to link your online identities together, or don't want to tell Google about them, then I very much understand that position, but there's not much I can suggest here to help you, except helping with any competition complaint. If you do want some level of identity linkage, then in order to minimise the damage if your Google profile is taken down, I recommend **linking together your profile pages on other sites**, rather than only linking everything to your Google profile.

A quick primer:

- `rel=author` is an [HTML5 feature](https://html.spec.whatwg.org/dev/links.html#link-type-author) for content to link to its author (be that a profile page, a direct email address, or otherwise). It applies to the `<article>` element containing it, or else to the whole page. Example:
  ```html
  ...by <a rel="author" href="/people/cmb">Chris Boyle</a>.
  ```
  Or on a single-author site, in the `<head>`:
  ```html
  <link rel="author" href="/" type="text/html" />
  ```
- `rel=me` came from [XFN in 2004](https://meyerweb.com/eric/thoughts/2004/08/16/xfn-11-released/) and allows a profile page to mark another profile page as being the same person. Example:
  ```html
  ...I'm also <a rel="me" href="http://example.com/profiles/foo">foo on example.com</a>.
  ```
- Google has [instructions old](http://www.google.com/support/webmasters/bin/answer.py?answer=1229920) and [new](http://www.google.com/support/webmasters/bin/answer.py?answer=1408986) on this; I recommend the old instructions, as only those include rel=me, and the new ones are based on an extra URL parameter that only works for G+.
  - They will follow author links pointing either to a G+ profile directly, or to an author page on the same domain (as long as there's some sort of link path from G+ back to the content).
  - In the same-domain case, they will follow rel=me to find a G+ profile if present (but only if there's a mutual rel=me link back from the G+ profile).
  - They have not said whether they'll follow more than one hop of rel=me.

Putting all this together:

![Possible link structures for rel=author](/images/20110904-gplus.png)

My recommendation: don't just do what's on the left here, because all those associations will be lost when your G+ profile is taken down. If you do something more like what's on the right, other identity services / social networks and other search engines will have a better chance of presenting what you want them to present. The warning in the bottom-right is a reminder that Google won't follow a content-to-author link to a different domain (they haven't said why). You may still want each profile to additionally link to G+, until it's established whether they'll follow more than one hop of `rel=me` for this purpose.
