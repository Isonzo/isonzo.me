---
title: "Self Hosting for Dummies"
date: 2022-08-21T19:38:02-04:00
tags: ['tutorial', 'tech']
summary: 'A guide to self hosting your website by someone who has done it exactly once'
image: 'apache_logo.png'
draft: true
---
{{<img caption="The process did not spark joy" alt="Apache Web Server" src="/img/apache_logo.png#center">}}

> _Disclaimer: This advice was written in part to commit to memory the process I had to go through to get this site up and running, and I do not guarantee anything whatsover, particularly regarding the quality of the advice.  
> Follow this "guide" at your own risk_
## So, you wanna be a strong and independent web dev who doesn't need no hosting service?
Well, although I would always encourage taking this path for the independence or for the joy of learning, sometimes you just wanna _see_ the results **ASAP**, and unfortunately a hosting service is the most immediate solution.
But what if you don't want to shell out your hard-earned cash on hosting? What if you could rather spend something infinitely more _expendable_, like your time and general well-being?

Jokes aside, self-hosting is pretty satisfying once you finally get it down, and it's a nice little skill to have in your repertoire should you ever have to deal with making some sort of internal web tool in your company some time in the future.
At the very least, it'll make you appreciate hosting services more for the convenience and ease of use they offer.

### So what do I gotta do?
Well, to give a very broad overview, using Apache Web Server you'll set up an http server and configure it.
You'll have to open the 80 port and redirect it to an unchanging ip (assuming you don't wanna repeat this process every time you turn off your server).
If you have a domain, make sure it points to your gateway IP.

Writing it out like that, it doesn't actually seem all that complicated.
But figuring out exactly how to do those steps can get pretty grating if you're starting out with 0 knowledge.
Unfortunately, something I noticed while investigating this topic is that many people have a slighly different way of doing it, or have a different version so certain things are ordered different or called in a different way.
So I'm simply throwing in what worked for me, and if I have an idea of the variants, I'll try to call them out.

No pinky promises though.

### So what's first?
Well, to start, install **_Apache Web Server_**.
You can simply install it with the package manager you are using, though the name varies by distro.
I'll name two examples.  
If you're on Arch, the package will be called **apache**.  
If you're on Debian, it'll be called **apache2**.
