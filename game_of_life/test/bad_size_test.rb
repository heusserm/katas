require_relative '../lib/game_of_life_lib.rb'

require 'minitest/autorun'

class TestGame_of_life_read_string < MiniTest::Test

  def test_bad_text_causes_error

    twoxtwobad =<<EOF
..
A.
EOF
    string_causes_error(twoxtwobad);
  end

 def test_not_griddy_causes_error

     reallybad=<<EOF
...
.*..
..
.
EOF
    string_causes_error(reallybad); 
  end


  def test_blank_first_line_causes_error
    blankfirst=<<EOF

..
..
*.
EOF
    string_causes_error(blankfirst);
  end

end   
 

#HelperMethod
def string_causes_error(baddata)
    playing = Game_of_life.new();
    assert_raises RuntimeError do
      playing.loadstring(baddata);
    end
end


