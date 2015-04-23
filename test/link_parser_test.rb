require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/link_parser"

class LinkParserTest < Minitest::Test
  def test_it_converts_link
    m = LinkParser.new("[This link](http://example.net/)")
    assert_equal "<a href=\"http://example.net/\">This link</a>", m.to_link
  end

  # def test_it_converts_link_with_title
  #   markdown = ''
  #   m = LinkParser.new("This is [an example](http://example.com/ "Title") inline link.")
  #
  # end
end
