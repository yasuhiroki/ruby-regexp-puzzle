require 'test/unit'
require './40lines'

class TestSample < Test::Unit::TestCase
  def test_match_one
    assert_equal true, match_one('a', 'a')
    assert_equal true, match_one('.', 'z')
    assert_equal true, match_one('', 'h')
    assert_equal false, match_one('a', 'b')
    assert_equal false, match_one('p', '')
  end
end
