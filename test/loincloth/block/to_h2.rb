require 'helper'

module Test
  module Loincloth
    module Block
      class ToH2 < Assertor::Case
        def should_return_convert_headers_with_4_minus
          should_convert "hello\n----", "<h2>hello</h2>"
        end
        
        def should_return_convert_regular_with_2_minus
          should_convert "hello\n--", "<h2>hello</h2>"
        end
        
        def should_leave_non_headers_untouched
          should_convert "hello", "hello"
        end
 
        private
        
        def should_convert(source, expectation)
          block = ::Loincloth::Block.new source
          block.to_h2
          assert_equals(block, expectation)
        end

      end
    end
  end
end
