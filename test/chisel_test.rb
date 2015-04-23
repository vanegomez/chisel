require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/chisel"

class ChiselTest < Minitest::Test
  def test_it_exist
    markdown = ChiselParser.new("markdown")
    assert markdown
  end

  def test_it_splits_a_chunk_of_text
    markdown = ChiselParser.new("markdown\nhtml")
    assert_equal ["markdown\nhtml"], markdown.markdown
  end

  def test_it_makes_a_paragraph
    markdown = ChiselParser.new("markdown\nhtml")
    assert_equal "<p>\nmarkdown\nhtml\n</p>\n", markdown.to_html
  end

  def test_it_replaces_hashtags
    markdown = ChiselParser.new("markdown\nhtml")
    assert_equal "<p>\nmarkdown\nhtml\n</p>\n", markdown.to_html
  end

  def test_it_replaces_asterisk_to_emphasis
    markdown = ChiselParser.new("My *emphasized and stronged text* is awesome.")
    assert_equal "<p>\nMy <em>emphasized and stronged text</em> is awesome.\n</p>\n", markdown.to_html
  end

  def test_it_replaces_two_asterisks_to_strong
    markdown = ChiselParser.new("My *emphasized and **stronged** text* is awesome.")
    assert_equal "<p>\nMy <em>emphasized and <strong>stronged</strong> text</em> is awesome.\n</p>\n", markdown.to_html
  end

  def test_it_replaces_amp_symbol
    markdown = ChiselParser.new("My *emphasized & **stronged** text* is awesome.")
    assert_equal "<p>\nMy <em>emphasized &amp; <strong>stronged</strong> text</em> is awesome.\n</p>\n", markdown.to_html
  end

  def test_it_replaces_unordered_lists
    markdown = ChiselParser.new("* Sushi\n* Barbeque\n* Mexican")
    assert_equal "<ul>\n<li>Sushi</li>\n<li>Barbeque</li>\n<li>Mexican</li>\n</ul>\n", markdown.to_html
  end

  def test_it_replaces_ordered_lists
    list = ChiselParser.new("1. Sushi\n2. Barbeque\n3. Mexican")
    assert_equal "<ol>\n<li>Sushi</li>\n<li>Barbeque</li>\n<li>Mexican</li>\n</ol>\n", list.to_html
  end

  def test_it_converts_link
    m = LinkParser.new("[This link](http://example.net/)")
    assert_equal "<a href=\"http://example.net/\">This link</a>", m.to_link_no_title
  end
end

