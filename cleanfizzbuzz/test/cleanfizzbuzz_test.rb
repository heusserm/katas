require_relative '../lib/cleanfizzbuzz_lib.rb'

require 'minitest/autorun'
 
class TestCleanfizzbuzz < MiniTest::Test
  
  def setup 
    @playing = Cleanfizzbuzz.new()
  end

  def test_init
    newobject = Cleanfizzbuzz.new()
    assert(newobject!=nil,"Created object")
  end

  def test_fizz
    assert_equal("fizz",@playing.getFizzBuzzForN(3))
  end

  def test_one
    assert_equal("1", @playing.getFizzBuzzForN(1), "one is 1")
  end

  def test_buzz
    assert(@playing.getFizzBuzzForN(5)=="buzz", "5 is buzz")
  end

  def test_fizzbuzz
    assert_equal(@playing.getFizzBuzzForN(15), "fizzbuzz")
  end

  def test_getFizz_one()
    assert_equal("1\n", @playing.getFizzBuzzForAGroupOneTo(1))
  end

  def test_getFizz_one_to_fifteen()
     expected="1\n2\nfizz\n4\nbuzz\nfizz\n7\n8\nfizz\nbuzz\n11\nfizz\n13\n14\nfizzbuzz\n"
     assert_equal(expected,@playing.getFizzBuzzForAGroupOneTo(15))
  end
  
end
