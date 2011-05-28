require 'helper'

module Test
  module LoinclothTests
    module Block
      class ToH1 < Assertor::Case
        def should_return_convert_regular_headers_into_h1s
          should_convert "hello\n====", "<h1>hello</h1>"
        end
=begin        
        def should_return_true_if_last_line_is_made_out_of_2_equal_signs
          should_return_true_on "hello\ncool\n=="
        end
        
        def should_return_false_if_last_line_contains_no_equal_signs
          should_return_false_on "hello\ncool\n=a=="
        end
        
        def should_return_false_if_block_contains_just_one_line
          should_return_false_on "hello\ncool\n=a=="
        end
        
        def should_return_false_if_block_contains_just_one_line_even_made_of_equal_signs
          should_return_false_on "==="
        end
=end
        private
        
        def should_convert(source, expectation)
          block = Loincloth::Block.new source
          assert_equals(block.to_h1, expectation)
        end

      end
    end
  end
end
