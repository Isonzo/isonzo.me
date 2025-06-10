---
title: "Datetime Psa"
date: 2025-06-10T09:35:53-05:00
tags: [tutorial, blog]
summary: Beware of time drift traveller!
image_dir: "datetime-psa"
image: totp.jpg
draft: false
---

So I haven't been using my github in a long time, but I figured I might as well use it to log in to leetcode and try doing those more frequently again.
However, as soon as I try to log in on my desktop, it simply doesn't work.

{{<img caption="It's so over" alt="TOTP two-factor authentication failed" src="totp_fail.png">}}

I was completely befuddled.
I thought perhaps I caught it just as it changed, since it supposedly changes every 30 seconds.
So I try again.
No luck.

I don't panic.
I know I have my recovery codes.
So I go retrieve them, dredging through painful memories of the past until I find my recovery codes.
I expend one of them, and check to see if anything changed.
It all _should_ be working, but it simply _isn't_.

**Why?**

### The reason why
My clock was slightly off.

That's it.

Since totp depends on your unix time being correct, if it's not correct, it will fail.
My desktop was, by this point, off enough to cause totp to reliably fail.

{{<img caption="NTP was disabled and System Clock was not synchronized" alt="A post-op screenshot of timedatectl" src="no_ntp.png">}}

I don't have a screenshot, and I'm not planning on going back to get one at this point.
But NTP was disabled, and the BIOS clock had drifted enough to the point that it became a problem.
This was verified with `timedatectl`.
With a simple:

`sudo timedatectl set-ntp on`  

All of my problems were solved.

I ended up checking my laptop as well, even though it never had any issues. NTP was also disabled, but it hadn't drifted enough to be an issue.
Still turned it on now, as I'm liable to forget if I leave it alone and then in the future I'll suffer for another 10 minutes once again.

I'm sure most of you are reasonable enough to configure this properly when setting up, but it did escape my mind and waste precious minutes!

Anyway, that's it for this glorified blogpost.
