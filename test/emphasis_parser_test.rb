require "minitest/autorun"
require "minitest/pride"
require "../lib/emphasis_parser"

class EmphasisParserTest < Minitest::Test
  def test_it_exists
    m = EmphasisParser.new("markdown")
    assert m
  end

  def test_it_replaces_asterisk_to_emphasis
    m = EmphasisParser.new("*markdown*")
    assert_equal "<em>markdown</em>", m.to_emphasis
  end


  def test_it_replaces_asterisk_to_emphasis_and_strong
    skip
    m = EmphasisParser.new("My *emphasized and **stronged** text* is awesome.")
    assert_equal "My <em>emphasized and <strong>stronged</strong> text</em> is awesome.", m.to_emphasis.to_strong
  end
end
