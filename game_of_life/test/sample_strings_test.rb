
require_relative 'sample_strings'
require 'minitest/autorun'


class TestGame_of_life_same_strings < MiniTest::Test

  def test_getvals
    result = Sample_Strings.twoxtwoblank();
    twoxtwoblank=<<EOF
..
..
EOF
    twoxtwoblank = twoxtwoblank.chomp;
    assert_equal(twoxtwoblank,Sample_Strings.twoxtwoblank(),"static call returns the right string");

    threexthreemiddle=<<EOF
...
.*.
...
EOF

    threexthreemiddle=threexthreemiddle.chomp;
    assert_equal(threexthreemiddle, Sample_Strings.threexthreemiddle(), "threexthree call returns the right string");
  end

end

