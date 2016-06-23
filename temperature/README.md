# temperature

This directory contains the code, requirements, and hints for the Fahrenheit to Celsius conversion ATDD training exercise.

The little program, FtoC.rb, takes a single fahrenheit value from the command line and converts it to celsius. Run it with:

_ruby FtoC.rb 212_

For example, to see the number 100.

Programmers will implmement this themselves, by filling in the text in the program FtoCTemplate.rb which, for now, always returns zero.

To check the program, use evalConversion.rb, which reads in input and expected results from as .csv file, runs the program, and prints the results in TAP, the Test Anything Protocol.

To get the feel for this, compare the following two command-line runs:

_ruby evalConversion.rb FtoCTemplate.rb sample01.csv_

and

_ruby evalConversion.rb FtoC.rb sample01.csv_

To run the exercise, break the BA/QA into one group and the programmers into a second. Give the programmers the document temperature_requirements.txt and ask them each to implement their own template, as FtoC<initials>.rb as a warmup exercise and "trivial project simulation."

Meanwhile, the BA/QA are filling out spreadsheets.

Then combine the groups and run the test programs through the .csv files. Ask "does this sound like typical software development?" then discuss the ATDD cycle. Assign teams; have the programmers "fix" the code and get a passing test run. Then talk about how to prevent the rework, ideally running a slightly more complex project test-first.
