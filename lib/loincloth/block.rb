module Loincloth

  class Block < String
  
    H1_BLOCK = /\A(.+)\n=+\z/m
    H2_BLOCK = /\A(.+)\n-+\z/m
    LIST_BLOCK = /\A\* (.+)\z/m
    HTML_LI_SEPARATOR = "</li>\n  <li>"
  
    def is_h1?
      h1_text
    end
    
    def is_h2?
      h2_text
    end
    
    def is_list?
      list_text
    end
    
    def to_h1
      replace "<h1>#{h1_text}</h1>" if is_h1?
      self
    end
    
    def to_h2
      replace "<h2>#{h2_text}</h2>" if is_h2?
      self
    end
    
    def to_list
      replace "<ul>\n#{list_items_text}\n</ul>" if is_list?
      self
    end
    
    private
    
    def h1_text
      @h1_text ||= self[H1_BLOCK, 1]
    end
    
    def h2_text
      @h2_text ||= self[H2_BLOCK, 1]
    end
    
    def list_text
      @list_text ||= self[LIST_BLOCK, 1]
    end
    
    def list_items_text
      "  <li>#{list_items.join HTML_LI_SEPARATOR}</li>"
    end
    
    def list_items
      list_text.split(/\n\* /)
    end
  
  end

end
