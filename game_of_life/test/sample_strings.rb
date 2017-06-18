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


    def self.threexthreemiddledaytwo
      val=<<EOF
...
...
...
EOF
     val = val.chomp;
     return val;
    end


#element 2,1 is special here in all of these cases
    def self.fivexfiveonesurvivor
      val=<<EOF
..*..
..*..
..*..
.....
.....
EOF
     val = val.chomp;
     return val;
    end


    def self.fivexfiveonesurvivorroundtwo
      val=<<EOF
.....
.***.
.....
.....
.....
EOF
     val = val.chomp;
     return val;
    end



def self.fivexfiveonesurvivorthreearound
      val=<<EOF
.*...
.**..
.*...
.....
.....
EOF
     val = val.chomp;
     return val;
    end


def self.fivexfiveonesurvivorthreearoundroundtwo
      val=<<EOF
.....
.**..
.....
.....
.....
EOF
     val = val.chomp;
     return val;
    end


    def self.fivexfivetoomanyaround
      val=<<EOF
.*...
***..
.*...
.....
.....
EOF
     val = val.chomp;
     return val;
    end

    def self.fivexfivetoomanyaroundroundtwo
      val=<<EOF
.*...
*.*..
.*...
.....
.....
EOF
     val = val.chomp;
     return val;
    end


    def self.fivexfivespontaneousgeneration
      val=<<EOF
.*...
..*..
.*...
.....
.....
EOF
     val = val.chomp;
     return val;
    end

    def self.fivexfivespontaneousgenerationroundtwo
      val=<<EOF
.....
.**..
.....
.....
.....
EOF
     val = val.chomp;
     return val;
    end

end

