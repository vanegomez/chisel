require "minitest/autorun"
require "minitest/pride"
require "../lib/strong_parser"

class StrongParserTest < Minitest::Test
  def test_it_exists
    m = StrongParser.new("**markdown**")
    assert m
  end

  def test_it_replaces_asterisk_to_emphasis
    m = StrongParser.new("**markdown**")
    assert_equal "<strong>markdown</strong>", m.to_strong
  end

  def test_it_replaces_asterisk_to_emphasis_and_strong
    s = StrongParser.new("**markdown**")
    e = EmphasisParser.new()
  end
end
