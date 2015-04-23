require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/emphasis_parser"

class EmphasisParserTest < Minitest::Test
  def test_it_exists
    m = EmphasisParser.new("markdown")
    assert m
  end

  def test_it_replaces_asterisk_to_emphasis
    m = EmphasisParser.new("*markdown*")
    assert_equal "<em>markdown</em>", m.to_emphasis
  end


  def test_it_replaces_one_asterisk_follow_by_a_word
    m = EmphasisParser.new("My *emphasized and **stronged** text* is awesome.")
    assert_equal "My <em>emphasized and **stronged** text</em> is awesome.", m.to_emphasis
  end
end
