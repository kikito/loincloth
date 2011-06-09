module Loincloth
  class BlockParser
    def initialize(stream)
      @stream = stream
    end
    def each_block(&action)
      buffer = []
      @stream.each{ |line|
        if is_block_separator(line)
          do_action(action, buffer)
          buffer = []
        else
          buffer << line.chomp
        end
      }
      do_action(action, buffer)
    end

    private

    BLOCK_SEPARATOR = /\A\n+\z/

    def is_block_separator(line)
      line =~ BLOCK_SEPARATOR
    end

    def do_action(action, buffer)
      action.call(buffer.join("\n")) unless buffer.empty?
    end

  end
end
