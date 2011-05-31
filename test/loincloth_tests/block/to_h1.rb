require 'helper'

module Test
  module LoinclothTests
    module Block
      class ToH1 < Assertor::Case
        def should_return_convert_headers_with_4_equals
          should_convert "hello\n====", "<h1>hello</h1>"
        end
        
        def should_return_convert_regular_with_2_equals
          should_convert "hello\n==", "<h1>hello</h1>"
        end
        
        def should_leave_non_headers_untouched
          should_convert "hello", "hello"
        end
 
        private
        
        def should_convert(source, expectation)
          block = Loincloth::Block.new source
          block.to_h1
          assert_equals(block, expectation)
        end

      end
    end
  end
end
