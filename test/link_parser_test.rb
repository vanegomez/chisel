require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/link_parser"

class LinkParserTest < Minitest::Test
  def test_it_converts_link
    m = LinkParser.new("[This link](http://example.net/)")
    assert_equal "<a href=\"http://example.net/\">This link</a>", m.to_link_no_title
  end
end