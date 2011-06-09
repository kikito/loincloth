require 'helper'

module Test
  module Loincloth
    module Block
      class IsH2 < Assertor::Case
        def should_return_true_if_last_line_is_made_out_of_3_minus_signs
          should_return_true_on "hello\ncool\n---"
        end
        
        def should_return_true_if_last_line_is_made_out_of_2_minus_signs
          should_return_true_on "hello\ncool\n--"
        end
        
        def should_return_false_if_last_line_contains_no_minus_signs
          should_return_false_on "hello\ncool\n-a--"
        end
        
        def should_return_false_if_block_contains_just_one_line
          should_return_false_on "hello"
        end
        
        def should_return_false_if_block_contains_just_one_line_even_made_of_minus_signs
          should_return_false_on "---"
        end
        
        private
        
        def should_return_true_on(text)
          block = ::Loincloth::Block.new text
          assert(block.is_h2?)
        end
        
        def should_return_false_on(text)
          block = ::Loincloth::Block.new text
          assert_not(block.is_h2?)
        end
      end
    end
  end
end
