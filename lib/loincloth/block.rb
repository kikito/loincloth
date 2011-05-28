module Loincloth

  class Block < String
  
    H1_BLOCK = /\A(.+)\n=+\z/m
  
    def lines
      @lines ||= split("\n")
    end
    
    def is_h1?
      self =~ H1_BLOCK
    end
    
    def to_h1
      Block.new("<h1>#{self[H1_BLOCK, 1]}</h1>")
    end
  
  end

end
