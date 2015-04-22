require 'pry'
require_relative "paragraph_parser"
require_relative "hash_parser"

class ChiselParser

  attr_reader :markdown

  def initialize(markdown) # take in a string with encoded markdown characters
    @markdown = markdown.split("\n\n")
  end

  def to_html
  paragraph = markdown.map {|line| ParagraphParser.new(line).to_paragraph}
  header = paragraph.map {|line| HashParser.new(line).to_header}

  # Evaluate array use map to send strings line by line
  #   # output string of parsed markdown converted into HTML
  #   # ChiselParser needs to use other specific parsers to check for each
  #   # type of tag
  #   # - HashParser
  #   # - EmParser
  #   # (i.e. do all the pieces)
  end


end

if __FILE__ == $0
  my_input  = ARGV[0]
  my_output = ARGV[1]
  markdown    = File.read(my_input)
  html        = ChiselParser.new(markdown).to_html
  File.write(my_output, html)
  puts "Converted #{my_input} (#{markdown.count("\n")} lines) to #{my_output} (#{html.count("<\n>")} lines)"
end

# input_string = "## here's some markdown"
# html        = ChiselParser.new(input_string).to_html
