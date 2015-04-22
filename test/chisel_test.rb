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


end

#<p>\nmarkdown\n</p>
# My *emphasized and **stronged** text* is awesome.
