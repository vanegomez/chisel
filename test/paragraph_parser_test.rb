require "minitest/autorun"
require "minitest/pride"
require "../lib/paragraph_parser"

class ParagraphParserTest < Minitest::Test
  def test_it_exist
    parragraph = ParagraphParser.new("markdown")
    assert parragraph
  end

  def test_it_returns_string
    parragraph = ParagraphParser.new("markdown")
    assert_equal "<p>\nmarkdown\n</p>", parragraph.to_paragraph
  end

  def test_it_is_not_a_paragraph_if_it_starts_with_a_hash
    parragraph = ParagraphParser.new("#markdown")
    assert_equal "#markdown", parragraph.to_paragraph
  end

  def test_it_is_not_a_paragraph_if_it_starts_with_two_hashes
    parragraph = ParagraphParser.new("##markdown")
    assert_equal "##markdown", parragraph.to_paragraph
  end

  def test_it_is_not_a_paragraph_if_it_starts_with_five_hashes
    parragraph = ParagraphParser.new("#####markdown")
    assert_equal "#####markdown", parragraph.to_paragraph
  end

  def test_it_is_not_a_paragraph_if_starts_with_asterik
    parragraph = ParagraphParser.new("*markdown")
    assert_equal "*markdown", parragraph.to_paragraph
  end

  def test_it_is_not_a_paragraph_if_starts_with_integer
    parragraph = ParagraphParser.new("1. markdown")
    assert_equal "1. markdown", parragraph.to_paragraph
  end
end
