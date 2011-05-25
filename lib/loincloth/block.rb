module Loincloth

  class Block < String
  
    def lines
      split(/[\n|\r]/)
    end
  
  end

end
