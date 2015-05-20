require_relative '../lib/webserver_lib.rb'

require 'minitest/autorun'

class TestWebserver < MiniTest::Test
  def test_init 
    playing = Webserver.new(8080,"./test_files")
    assert(playing!=nil,"Created object")
    assert_equal(Webserver, playing.class)
  end

  def test_get_not_a_file
    playing = Webserver.new(8080,"./test_files")
    getval = playing.get("notafile")
    assert_equal(nil, getval)
  end


  def test_get_a_file
    playing = Webserver.new(8080,"./test_files")
    actual_result = playing.get("simple.txt")
expected_result=<<EOF
This is a very simple test.
To tell if the software can read a ASCII file
EOF
    assert_equal(expected_result, actual_result)

  end
end
