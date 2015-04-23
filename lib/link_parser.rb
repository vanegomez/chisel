class LinkParser
  attr_reader :markdown

  def initialize(markdown)
    @markdown = markdown
  end

  def to_link
    '<a href="' + hyperlink + '">' + link_words + '</a>'
  end

  def hyperlink
    replace_borders(/\((.+)\)/)
  end

  def link_words
    replace_borders(/\[(.+)\]/)
  end

  def replace_borders(reg)
    markdown[reg][1...-1]
  end
end

# [This link](http://example.net/)
# <a href="http://example.net/">This link</a>


# This is [an example](http://example.com/ "Title") inline link.
# <p>This is <a href="http://example.com/" title="Title"> an example</a> inline link.</p>
