# katas

This directory contains my katas, mostly in ruby. The typical pattern is a setup like this:

kataname.rb

./test/test_kataname.rb

./lib/kataname_lib.rb

To run the kata, type kataname.rb, or go into the test directory and run the test file.

## pre-requisites

This code was tested under ruby 2.2.1p85 but should work with other versions. 

You'll also need the minitest gem. To install minitest:

gem install minitest


## katagenerator.rb

This program will create a kata directory and related files - the "shell."

So for example, you type - ruby katagenerator.rb mattskata. You should see:

./mattskata/mattskata.rb

./mattskata/test/test_mattskata.rb

./mattskata/lib/mattskata_lib.rb

The class name would be Mattskata - capitalize the first name.

## temperature

Temperature is a bit different. It's a ruby program designed to help teach Acceptance Test Driven Development for the broadest possible range of people.

The little program, FtoC.rb, takes a single fahrenheit value from the command line and converts it to celsius. Run it with:

_ruby FtoC.rb 212_

For example, to see the number 100.

Programmers will implmement this themselves, by filling in the text in the program FtoCTemplate.rb which, for now, always returns zero.

To check the program, use evalConversion.rb, which reads in input and expected results from as .csv file, runs the program, and prints the results in TAP, the Test Anything Protocol.

To get the feel for this, compare the following two command-line runs:

_ruby evalConversion.rb FtoCTemplate.rb sample01.csv_

and

_ruby evalConversion.rb FtoC.rb sample01.csv_

To run the exercise, break the BA/QA into one group and the programmers into a second. Give a simple requirements document to the programmers and ask them each to implement their own template, as FtoC<initials>.rb. Call it a warmup; challenge the programmers to do it in as few keystrokes as possible. Meanwhile, the BA/QA are filling out the sheet.

Then combine the groups and run the test programs through the .csv files. Ask "does this sound like typical software development?" then discuss the ATDD cycle.

