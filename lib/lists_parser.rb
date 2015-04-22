class ListsParser
  attr_reader :markdown
  def initialize(markdown)
    @markdown = markdown
  end

  def to_ulist
    if markdown.start_with?("*")
    "<ul>\n" + markdown.gsub(/\* (.+)/,"<li>\\1</li>") + "</ul>"
    else
      markdown
    end
  end

  def to_olist
    # if markdown.start_with?("")
    "<ol>\n" + markdown.gsub(/^\d+\. (.+)/,"<li>\\1</li>") + "</ol>"
    # end
  end

end

