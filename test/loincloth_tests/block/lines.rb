require 'helper'

module Test
  module LoinclothTests
    module Block
      class Lines < Assertor::Case
      
        def should_return_empty_when_empty
          test_text("",[])
        end
        
        def should_separate_by_n
          test_text("first\nsecond\nthird", ["first", "second", "third"])
        end
        
        private
        
        def test_text(text, lines)
          assert_equals(Loincloth::Block.new(text).lines, lines)
        end
      end
    end
  end
end
