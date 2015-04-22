require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/chisel"

class ChiselTest < Minitest::Test
  def test_it_exist
    markdown = ChiselParser.new("markdown")
    assert markdown
  end

  def test_it_takes_a_string_and_splits_it
    markdown = ChiselParser.new("markdown\nhtml")
    assert_equal ["markdown\nhtml"], markdown.markdown
  end

  def test_it_makes_a_paragraph
    markdown = ChiselParser.new("markdown\nhtml")
    assert_equal "<p>\nmarkdown\nhtml\n</p>", markdown.to_html
  end

  def test_it_replaces_to_amp
    markdown = ChiselParser.new("markdown\nhtml &")
    assert_equal "<p>\nmarkdown\nhtml &amp;\n</p>", markdown.to_html
  end

end

#<p>\nmarkdown\n</p>
# My *emphasized and **stronged** text* is awesome.
