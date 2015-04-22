require 'pry'
require_relative "paragraph_parser"
require_relative "hash_parser"
require_relative "amp_parser"

class ChiselParser

  attr_reader :markdown

  def initialize(markdown) # take in a string with encoded markdown characters
    @markdown = markdown.split("\n\n")
  end

  def to_html
    chunks = markdown
    chunks = chunks.map {|line| ParagraphParser.new(line).to_paragraph}
    chunks = chunks.map {|line| HashParser.new(line).to_header}
    chunks = chunks.map {|line| AmpParser.new(line).to_amp}

  # emphasis
  # Strong
  # make a test for emphasis and strong
  # U_lists
  # O_lists
    chunks.join("\n")
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
