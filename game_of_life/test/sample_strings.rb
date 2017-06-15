class Sample_Strings

#Static data class to help in testing
#No need to new or create instances.
    
    def self.twoxtwoblank
      val=<<EOF
..
..
EOF
      val = val.chomp;
      return val;
    
    end

    def self.threexthreemiddle
      val=<<EOF
...
.*.
...
EOF
     val = val.chomp;
     return val;
    end
end



