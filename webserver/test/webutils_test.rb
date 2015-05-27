require_relative '../lib/webserver_lib.rb'

require 'minitest/autorun'

class TestWebutils < MiniTest::Test


  def test_get_not_a_file
    utils = Webutils.new("./test_files")
    getval = utils.get_file("notafile")
    assert_equal(nil, getval)
  end

  def test_get_a_file
    utils = Webutils.new("./test_files")
    actual_result = utils.get_file("simple.txt")
expected_result=<<EOF
This is a very simple test.
To tell if the software can read a ASCII file
EOF
    assert_equal(expected_result, actual_result)
  end




end

