


class CSVExecutor
  attr_accessor :rows
  attr_accessor :tapoutput

  def initialize(filename)
    
    if (defined? filename) && (nil!= filename) then
      @rows = IO.readlines(filename)
    else
      raise 'Must include filename from the command line'
    end
  end

  def run_tests
    @tapoutput = TapOutput.new(@rows.length)
    rows.each { |row| execute_a_check(row) }
  end

  def execute_a_check(row)
    data = row.split(",")
    url = data[0]
    compare = data[1]
    match = data[2]
    comment = data[3]
    command = "curl -s -H " + '"' + 'Accept: application/json" ' + url
    output = `#{command}`
    output = output.gsub("\n","")
    output = output.gsub("\r","")
    output = output.gsub(",","|")
    #puts "output is (" + output + ")" + "\n\n\n\n"
    #puts "compare is (" + compare + ")" + "\n\n\n\n"
    #puts "match is " + match
    if match == "Y" then
      escaped =  Regexp.new(Regexp.escape(compare)).to_s()
      #puts "escaped is (" + escaped + ")" + "\n\n\n\n"
      result = (output=~/#{escaped}/)
      #puts result.to_s()
      @tapoutput.ok(result, comment) 
    else
      @tapoutput.ok(output == compare, comment)
    end
  end

end



class TapOutput
    attr_accessor :current_check
    attr_accessor :num_checks

    def ok(compare, comment)
      if compare then
         puts "ok " + current_check.to_s()  + " - " + comment
      else
         puts "not ok " + current_check.to_s() + " - " + comment
      end
      @current_check+=1
    end

    def initialize(num_checks)
      if (defined? num_checks) && (nil!= num_checks) then
       @num_checks = num_checks
       puts "1.." + num_checks.to_s()
      end
      @current_check=1
    end

    def fail_to_run(comment)
      puts "1..1"
      if (defined? comment) && (nil!= comment) then
        puts "Not Ok 1 - " + comment
      else
        puts "Not Ok 1 - Failed to run at all for some reason. Couldn't even get started"
      end
    end
end





filename = ARGV[0]
if  !(defined? filename) || (nil== filename) then
  tapoutput = TapOutput.new(1)
  tapoutput.fail_to_run("No input file specified. Seriously, type in api_tester.rb <some_actual_file_name> please") 
end

testrunner = CSVExecutor.new(filename)
testrunner.run_tests()

