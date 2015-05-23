# The Webserver Kata 

I met Zed Shaw are Oredev in 2012, and he suggested I write a webserver.

So I did. Or at least, I started.

This directory contains the simple webserver kata I am working on.

## To run it 

You'll need to install minitest and ruby. Then just run this from the command line:

ruby webserver.rb

That's it. It assumes port 8080 and serves files out of the ./test/test_files directory. Blank requests redirect to index.html.

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

I just modified the server to run in parellel with fork. Forking in Ruby feels ... different than it does in C. I'd be interested in learn better idioms for my code.

## TODO

Extract the message code headers to their own helper class

Make the parameter handling templated, maybe write a helper class for that

Add security features 

Add support for other content-types

Add POST and CGI

Serve Binary Files, MIME encoding, etc

Support the entire HTTP 1.1 standard

Add other newer standard supports

Extend the example directories/files

Extract code inside do/loop to it's own function - integration test that

## TODONE - Requirements of the Kata (One way to do it)

1) Create an object that takes a port and start directory

2) Extract the object to a file; create a test file for it

3) Create a driver file that news the class and .serves it

4) Read from a file into a string (Return null for errors)

5) Take HTTP Get with url and get filename

6) Create function that ties 4&5 and handles exceptions

7) Create 200 OK and 404 error headers

8) tie results to print full header and text

9) Create simple socket to get requests and put results

10) Wrap #9 in a do loop

11) Make #10 a forking server

12) Handle '/' and '' urls to redirect to index.html

13) Add to examples with files that reference files (CSS and js etc)

14) Security - Sanatize inputs. Do not give access via ../../ for example
