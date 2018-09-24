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

  def test_match
    assert_equal true, match('a', 'a')
    assert_equal true, match('abc', 'abc')
    assert_equal true, match('a.c', 'abc')
    assert_equal false, match('a', 'b')
    assert_equal false, match('abc', 'adc')
    assert_equal false, match('a.c', 'abb')

    assert_equal true, match('abc$', 'abc')
    assert_equal true, match('a.c$', 'abc')
    assert_equal false, match('abc$', 'abcc')
  end

  def test_search
    assert_equal true, search('^abc', 'abc')
    assert_equal true, search('^a.c', 'abc')
    assert_equal false, search('^abc', 'aabc')

    assert_equal true, search('abc', 'aabc')
    assert_equal true, search('a.c', 'babc')
    assert_equal true, search('abc$', 'aabc')
    assert_equal true, search('abc', 'aabc')
    assert_equal false, search('abc', 'aabbc')
  end
end
