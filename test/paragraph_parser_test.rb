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

  def test_it_returns_string_with_one_hash
    parragraph = ParagraphParser.new("#markdown")
    assert_equal "#markdown", parragraph.to_paragraph
  end

  def test_it_returns_string_with_two_hashes
    parragraph = ParagraphParser.new("##markdown")
    assert_equal "##markdown", parragraph.to_paragraph
  end

  def test_it_returns_string_with_five_hashes
    parragraph = ParagraphParser.new("#####markdown")
    assert_equal "#####markdown", parragraph.to_paragraph
  end

end
