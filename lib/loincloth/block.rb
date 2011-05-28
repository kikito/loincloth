module Loincloth

  class Block < String
  
    H1_BLOCK = /\A(.+)\n=+\z/m
    H2_BLOCK = /\A(.+)\n-+\z/m
  
    def lines
      @lines ||= split("\n")
    end
    
    def is_h1?
      h1_text
    end
    
    def is_h2?
      h2_text
    end
    
    def to_h1
      return Block.new("<h1>#{h1_text}</h1>") if is_h1?
      self
    end
    
    def to_h2
      return Block.new("<h2>#{h1_text}</h2>") if is_h2?
      self
    end
    
    private
    
    def h1_text
      @h1_text ||= self[H1_BLOCK, 1]
    end
    
    def h2_text
      @h2_text ||= self[H2_BLOCK, 1]
    end
  
  end

end
