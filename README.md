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

Read more about it in the README.md in the program's directory.
