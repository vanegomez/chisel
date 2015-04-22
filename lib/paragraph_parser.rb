class ParagraphParser
  attr_reader :markdown
  def initialize(markdown)
    @markdown = markdown
  end

  def to_paragraph
    require 'pry'
    binding.pry
    if markdown.start_with?("#")
      markdown
    else
      "<p>\n" + markdown + "\n</p>"
    end
  end
end


# asterisks and numbers
