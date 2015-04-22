require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/amp_parser"

class AmpParserTest < Minitest::Test
  def test_it_replaces_to_amp
    m = AmpParser.new("& markdown")
    assert_equal "&amp; markdown", m.to_amp
  end

  def test_it_replaces_amp_at_end_of_line
    m = AmpParser.new("markdown &")
    assert_equal "markdown &amp;", m.to_amp
  end

  def test_it_replaces_amp_at_beggining_end_of_line
    m = AmpParser.new("& markdown &")
    assert_equal "&amp; markdown &amp;", m.to_amp
  end
end
