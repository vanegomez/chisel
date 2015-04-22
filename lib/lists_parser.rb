class ListsParser
  attr_reader :markdown
  def initialize(markdown)
    @markdown = markdown
  end

  def to_ulist
    "<ul>\n" + markdown.gsub(/\* (.+)/,"<li>\\1</li>") + "</ul>"
  end

  def to_olist
    "<ol>\n" + markdown.gsub(/^\d+\. (.+)/,"<li>\\1</li>") + "</ol>"
  end

end

