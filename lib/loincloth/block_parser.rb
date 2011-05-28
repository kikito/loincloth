module Loincloth
  class BlockParser
    def initialize(io)
      @io = io
    end
    def each_block(&action)
      buffer = []
      @io.each{ |line|
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
    
    def is_block_separator(line)
      line =~ /\A\n+\z/
    end
    
    def do_action(action, buffer)
      action.call(buffer.join("\n")) unless buffer.empty?
    end
    
  end
end
