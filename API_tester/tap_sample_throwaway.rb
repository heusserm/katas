

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
end


tapoutput = TapOutput.new(2)

tapoutput.ok(1==1,"hello world");
tapoutput.ok(1==2,"but not goodbye");
