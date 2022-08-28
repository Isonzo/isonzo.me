---
title: "Self Hosting for Dummies"
date: 2022-08-26T19:38:02-04:00
tags: ['tutorial', 'tech']
summary: 'A guide to self hosting your website by someone who has done it exactly once'
image: 'apache_logo.png'
draft: false
---
{{<img caption="Actually pretty easy once you know exactly what to do." alt="Apache Web Server" src="/img/apache_logo.png#center">}}

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
I'll name two examples:

If you're on Arch, the package will be called **apache**.  
If you're on Debian, it'll be called **apache2**.

In any case you can search up how to install apache on your machine. After that, the service will either start automatically or you will have to start the service manually.

In my Arch machine, I have to start it with `systemctl start httpd.service`  
In my Debian machine, it starts automatically.

Once the service has started, you can check if it works by going to your localhost or your machine's private ip address (you can check with `ip a`, it should be something like 192.168.x.x). 
You should something related to apache or some default site, it varies version to version. 
If connection fails, be sure if the service is running.
If apache is still being naughty, [you may need to do some investigative work.](https://www.google.com/search?q=help+apache+is+not+working&oq=help+apache+is+not+working)
{{<img caption="It's alive!" alt="Debian Apache connection successful" src="/img/debian_apache_works.jpeg#center">}}

You can actually view your website through apache now to debug your site and make sure it works. 
If you're using a static site generator, like [Hugo](gohugo.io), this is a good way to verify that everything will work fine down the line and that there are no broken links or missing images.
Simply place your site files in the correct location!
In Arch, it's `/srv/http/`  
In Debian, it's `/var/www/html/`

People in your local network can now see your website if they enter your ip in the address bar!
As long as you keep the apache server up, that is.
{{<img caption="You might wanna chown or give permissions to facilitate frequent changes..." alt="mv /srv/hhtp/ permission denied" src="/img/permission_denied_srv.png#center">}}

### That's neat and all, but how do I get others to connect from _outside_ my network?
Yes, yes, I realize you want the whole world to be able to see the inner machinations of your mind, and for that we need to start configuring a couple of different things.

First, **your router**.
You'll need to open some ports.
Since we'll start by simply hosting via http, 
You'll need to _port forward_.
Now, an issue with routers is that they're all different.
So you'll want to follow a [dedicated guide to your specific router](https://portforward.com/) and do two things: open port 80, and set up either a static IP or a [DHCP rservation](https://portforward.com/dhcp-reservation/)
Technically, all you need is to open the port, but having an unchanging IP will make it so you don't need to reconfigure once you shut down your computer.

Another technicality, if you're only ever planning on having one website and no domain, you're done. 
Just make sure you keep the apache service running and share [your ip](https://whatismyipaddress.com/).
If it doesn't work, you might have to verify some settings in apache, such as the _listen port_ and all that, which we will be _briefly_ touching upon next.

Regardless of what you want to do in the end, I'm going to assume you have your domains and you wanna host multiple websites, so let's keep going with this primer.

Some organization is in order. 
You were dumping your site directly into the srv/http/ or /var/www/html/ directory. 
Instead, make a new directory to store your site, it's standard to name it after your domain (in my case, I named the directory _isonzo.me_).
You can start deploying or storing your site in that newly made directory.

So now we have to alter some configurations in apache.
First, you'll have to find the main .conf file.

In Arch, this is located in `/etc/httpd/conf/httpd.conf`  
in Debian, it's placed in `/etc/apache2/apache2.conf`

In Arch, you'll want to go to uncomment `#Include conf/extra/httpd-vhosts.conf`; simply delete the '#'.  
In Debian, I didn't have to do anything, but in any case the relevant line is #IncludeOptional sites-enabled/\*.conf

And now all you have to do is add your site's data to the VirtualHost.
In Arch, you'll append VirtualHosts at the end of `conf/extra/httpd-vhosts.conf`
The key parameters are **SiteName** and **DocumentRoot**.
In Sitename, you simply put your sites url (for example, for this site I put __isonzo.me__.
In DocumentRoot, you put the absolute path to your site, in my case it's /var/www/isonzo.me (or /srv/html/isonzo.me if I was on Arch).
Notice the lack of a leading slash at the end.
You may fill out the other data if you want, but it's not strictly necessary for getting your site up and running.

Afterwards, you'll want to restart Apache to load in the new configurations.
You can do that using ´systemctl restart apache2.service´ in Debian or ´systemctl restart httpd.service´in Arch

{{<img caption="Be the bad boy you always dreamt of, and attract all the ladies." alt="connection not secured" src="/img/connection_insecure.png#center">}}
## Is the site finally done?
All you have to do now is make your domain point to your router's ip, and you're done!
Going to your domain should send you directly to your site, and you can have multiple sites!
That's basically it.

Some considerations you can take is setting up an https connection instead of an http connection, as well as making sure you don't show your directory when someone types your ip (once Virtual Hosts are set up). I leave this as an exercise to the interested party until potentially decide to update this post.
