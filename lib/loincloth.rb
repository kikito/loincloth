require 'loincloth/block_parser'
require 'loincloth/block'

class Loincloth

  def initialize(input_stream)
    input_stream = StringIO.new(input_stream) if input_stream.is_a? String
    @parser = BlockParser.new(input_stream)
  end

  def to_html(stream=nil)
    output_stream = stream.nil? ? StringIO.new : stream
    @parser.each_block do |b|
      b.process
      output_stream << "\n" << b << "\n"
    end
    return output_stream.string if stream.nil?
  end

end
