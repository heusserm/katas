# API Tester

By Matthew Heusser - Matt.Heusser at gmail dot com

This is a simple program that takes in a .csv delimited list of URLs to call and the expected result. Call it like this on a UNIX, Linux, or Mac system:

ruby api_tester.rb <filename.csv>

The output will be in TAP (Test Anything Protocol) format.

## pre-requisites

This code was tested under ruby 2.2.1p85 but should work with other versions. 

You'll need curl available from the system() command. If you are on windows, you'll need to download it, for example, at http://curl.haxx.se/download.html

## Use 

The CSV file should have these parameters:

| fully qualified url to call | expected result, with CRLFs removed | substringmatch YN | comments |

That is, we'll call curl on the URL we are passed in, get rid of the whitepspace (s/[\r\n]//g), and compare that to the expected result.

If substringmatch is Y, we believe the data to be a substring; if it is N, we expect that to be the entire transmission.

The file sample_api_data.txt is one file you can use.

## Getting Started

Make sure you have ruby and curl, download all this to one directory, then run:

ruby api_tester.rb sample_api_data.txt 

## Possible future extension

1) Add code to escape and de-escape commas in test data - Done. Commas are turned into pipes. To match in your text file, convert your commas to pipes - the | character

2) Allow API tester to loop through a directory of files

3) Integrate with an HTML output report generator, such as tap2html

