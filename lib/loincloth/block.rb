module Loincloth

  class Block < String

    def process
      to_h1
      to_h2
      to_list
      to_paragraph
      strongize
      emphasize
      imaginize
      link
    end

    def to_h1
      replace "<h1>#{h1_text}</h1>" if is_h1?
    end
    
    def to_h2
      replace "<h2>#{h2_text}</h2>" if is_h2?
    end
    
    def to_list
      replace "<ul>\n#{list_items_text}\n</ul>" if is_list?
    end

    def to_paragraph
      replace "<p>#{self}</p>" if is_paragraph?
    end
    
    def link
      gsub! LINK do |s|
        "<a href=\"#{$2}\" title=\"#{$1}\">#{$1}</a>"
      end
    end
    
    def imaginize
      gsub! IMAGE do |s|
        "<img src=\"#{$2}\" alt=\"#{$1}\" title=\"#{$1}\" />"
      end
    end
    
    def emphasize
      gsub! EMPHASIS do |s|
        "<em>#{$1}</em>"
      end
    end
    
    def strongize
      gsub! STRONG do |s|
        "<strong>#{$1}</strong>"
      end
    end

    def is_h1?
      h1_text
    end
    
    def is_h2?
      h2_text
    end
    
    def is_list?
      list_text
    end

    def is_paragraph?
      !is_h1? && !is_h2? && !is_list?
    end

    private

    H1_BLOCK = /\A(.+)\n=+\z/m
    H2_BLOCK = /\A(.+)\n-+\z/m
    LIST_BLOCK = /\A\* (.+)\z/m
    LI_SEPARATOR = /\n\* /
    LINK = /\[(.*?)\]\((.*?)\)/m
    IMAGE = /!\[(.*?)\]\((.*?)\)/m
    EMPHASIS = /\*(.+?)\*/m
    STRONG = /\*\*(.+?)\*\*/m
    HTML_LI_SEPARATOR = "</li>\n  <li>"

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
      list_text.split LI_SEPARATOR
    end
  
  end

end
