require "minitest/autorun"
require "minitest/pride"
require "../lib/hash_parser"

class HashParserTest < Minitest::Test

  def test_it_count_one_hashes
    m = HashParser.new("# markdown")
    assert_equal 1, m.hash_counter
  end

  def test_it_count_two_hashes
    m = HashParser.new("## markdown")
    assert_equal 2, m.hash_counter
  end

  def test_it_count_five_hashes
    m = HashParser.new("##### markdown")
    assert_equal 5, m.hash_counter
  end

  def test_it_replaces_one_hash
    m = HashParser.new("# markdown")
    assert_equal "<h1>markdown</h1>\n", m.to_header
  end

  def test_it_replaces_two_hashes
    m = HashParser.new("## markdown")
    assert_equal "<h2>markdown</h2>\n", m.to_header
  end

  def test_it_replaces_five_hashes
    m = HashParser.new("##### markdown")
    assert_equal "<h5>markdown</h5>\n", m.to_header
  end

end

