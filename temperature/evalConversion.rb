
#evalconversion.rb
#By Excelon Development - Matt@xndev.com
#
#This program takes the following command line options:
#
# ruby evalConversion.rb (F_to_c_program.rb) (spreadsheet.csv)
#
# If you want to code something other than a ruby program, you'll need to change the run_program function.
#
# The CSV file should have only as many rows as it has actual data. If you export blank lines and don't
# delete them, you'll get some funny errors.
#
# Output is in TAP format. Program error return codes are the number of failing tests, so you can call this and
# pass it to a TAP parser.
#
#

require 'csv'

class CsvTester

    def initialize(rubyFilename, csvFilename)
      @csvFilename = csvFilename
      @rubyFilename = rubyFilename
      @total_ok = 0
      @count = 0
    end

    def evaluate()
      CSV.foreach(@csvFilename) do |row|
          f = row[0]
          expected = row[1]
          comment = row[2]
          output = run_program(f)
          output = output.strip
          is(output, expected, comment)
      end

      return (@count-@total_ok)
    end

    def run_program(f)
      commandline = "ruby " +  @rubyFilename + " " + f.to_s()
      generated_result = `#{commandline}`
      return generated_result
    end

    def is(a, b, comment)
      @count+=1
      output = "ok #{@count.to_s()}"

      if a==b
        @total_ok+=1
      else
        output = "not " + output
      end

      output += " #{comment}" if comment

      puts output
    end
end

inRubyScript = ARGV[0]
inCSVFile = ARGV[1]


csvEvaler = CsvTester.new(inRubyScript, inCSVFile)
exitcode = csvEvaler.evaluate()
exit(exitcode)
