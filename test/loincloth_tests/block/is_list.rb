require 'helper'

module Test
  module LoinclothTests
    module Block
      class IsList < Assertor::Case
        def should_return_true_if_first_line_begins_with_star_space
          should_return_true_on "* hello"
        end
        
        def should_return_true_if_first_line_begins_with_star_spaces
          should_return_true_on "*   hello"
        end
        
        def should_return_false_if_first_line_begins_with_star_star
          should_return_false_on "** hello"
        end
        
        def should_return_false_on_regular_text
          should_return_false_on "hello"
        end
        
        private
        
        def should_return_true_on(text)
          block = Loincloth::Block.new text
          assert(block.is_list?)
        end
        
        def should_return_false_on(text)
          block = Loincloth::Block.new text
          assert_not(block.is_list?)
        end
        
      end
    end
  end
end
