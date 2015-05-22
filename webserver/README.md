# Simple Webserver 

I met Zed Shaw are Oredev in 2012, and he suggested I write a webserver.

So I did. Or at least, I started.

This directory contains the simple webserver kata I am working on.

## To run it 

You'll need to install minitest and ruby. Then just run this from the command line:

ruby webserver.rb

That's it. It assumes port 8080 and serves files out of the ./test/test_files directory.

Make sure you don't have a webserver running already on port 8080. If you want a specific port, try:

ruby webserver.rb (port) (directory)

## To use it

Drop html files into the directory, then in your browser try:

http://127.0.0.1:port/filename.html

Where port is the port number and filename is the filename. That's it.

127.0.0.1 is the localhost loopback IP address. IF you know your IP address, you can server from other computers.

## pre-requisites

This code was tested under ruby 2.2.1p85 but should work with other versions. 

You'll also need the minitest gem. To install minitest:

gem install minitest


## features

This will serve ASCII text files out of the directory you specify, and return 200 OK GETS, along with text, or a 404 error message. That is all that is supported at this time. If you are worried about DDOS or hacking etc, well, run it behind a firewall and not in a DMZ.

The software currently serves in serial, so multiple simultaneous users may experience dropped connections.

## TODO

Run in parellel (forking or threads)

Extract the message code headers to their own helper class

Make the parameter handling templated, maybe write a helper class for that

Add security features 
* (Don't serve up directories, for one thing)

Add support for other content-types

Add POST and CGI

Serve Binary Files, MIME encoding, etc

Support the entire HTTP 1.1 standard

Add other newer standard supports

Extend the example directories/files

