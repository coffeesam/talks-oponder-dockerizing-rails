README
======

The final product of the Dockerizing Rails and Zero Downtime Deployment
talk Oliver Ponder gave at the Singapore Ruby Meetup on 29th of September 2015.

Slides are also included in this repo. See `slides.pdf`, though they might not
work very well on their own, since I try to keep my slides light in text.

This is a introduction to using a load balancer and dockerizing
a Rails Application. Not meant for production unfortunately.

Consider it a starting point / playground. If there is a lot of interest in this
and time allows, I can try to make it more acceptable to use in a production setting.

Though I think there are better guides / examples out there. Hopefully this
got your interest and showed you something neat you can do with Docker and Rails.

Lastly I'd also like to point you to Giant Swarm's guides for running applications
on our cluster: https://docs.giantswarm.io/guides/

In those cases, Giant Swarm provides the load balancer and you only have to focus
on getting a container for your application that responds to HTTP.

### Usage:

Install Docker and Docker Compose:

You can follow the normal guide (https://docs.docker.com/installation/), or
use Dinghy if you have a mac, which I prefer because it is faster:
https://github.com/codekitchen/dinghy

### If using dinghy:

Dinghy ships with its own http proxy and a dns server. It will make *.docker
go to the Docker Host in the Virtual Machine that it installs.

Make sure you start dinghy without the http proxy, otherwise the loadbalancer
won't be able to bind to port 80:

`dinghy up --no-proxy`

### If not using dinghy:

Since the loadbalancer depends on the host header to know what backend to direct
requests to you will have to set up an entry in your hosts file.

The hosts file is a way for you to manually set dns records. So you'll want to
set a record that links `local.docker` to the IP address of your Docker Host.

Here's what a host file usually looks like, with an entry for local.docker. Your
ip might be different though:

```
127.0.0.1 localhost
x.x.x.x <other entries>

192.168.59.103 local.docker
```

Do a bit of googling if you don't know how to edit your host file for your operating
system:
https://www.google.com.sg/search?q=adding+entries+to+your+host+file&oq=adding+entries+to+your+host+file&aqs=chrome..69i57.3316j0j7&sourceid=chrome&es_sm=91&ie=UTF-8

### Starting the app

Once you've installed docker, and either started dinghy without the proxy, or
set a manual entry in your hostfile pointing `local.docker` to your Docker Host's
ip address you should be able to run `docker-compose up` from your terminal while
in this folder.

The app will start up and become available from your browser at `local.docker`

Now you can make edits to the app, scale it up or down, and play around with it!

### Further reading:

Using Nginx instead of Hipache:
https://www.digitalocean.com/community/tutorials/docker-explained-how-to-containerize-and-use-nginx-as-a-proxy

Using Nginx along with Consul Template:
https://tech.bellycard.com/blog/load-balancing-docker-containers-with-nginx-and-consul-template/
