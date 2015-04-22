require_relative "paragraph_parser"
require_relative "header_parser"
require_relative "emphasis_parser"
require_relative "strong_parser"
require_relative "amp_parser"
require_relative "lists_parser"

class ChiselParser

  attr_reader :markdown

  def initialize(markdown) # take in a string with encoded markdown characters
    @markdown = markdown.split("\n\n")
  end

  def to_html
    chunks = markdown
    chunks = chunks.map {|line| ParagraphParser.new(line).to_paragraph}
    chunks = chunks.map {|line| HeaderParser.new(line).to_header}
    chunks = chunks.map {|line| EmphasisParser.new(line).to_emphasis}
    chunks = chunks.map {|line| StrongParser.new(line).to_strong}
    chunks = chunks.map {|line| AmpParser.new(line).to_amp}
    chunks = chunks.map {|line| ListsParser.new(line).to_ulist}
    chunks = chunks.map {|line| ListsParser.new(line).to_olist}


    # U_lists
  # O_lists
  # links
    chunks.join("\n")
  end


end

if __FILE__ == $0
  my_input  = ARGV[0]

  my_output = ARGV[1]
  markdown  = File.read(my_input)
  html      = ChiselParser.new(markdown).to_html
  File.write(my_output, html)
  puts "Converted #{my_input} (#{markdown.count("\n")} lines) to #{my_output} (#{html.count("<\n>")} lines)"
end

# input_string = "## here's some markdown"
# html        = ChiselParser.new(input_string).to_html
