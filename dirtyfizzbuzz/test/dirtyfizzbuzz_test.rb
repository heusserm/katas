require_relative '../lib/dirtyfizzbuzz_lib.rb'

require 'minitest/autorun'

class TestDirtyfizzbuzz < MiniTest::Test
  def test_init 
    playing = Dirtyfizzbuzz.new()
    assert(playing!=nil,"Created object")
  end

end