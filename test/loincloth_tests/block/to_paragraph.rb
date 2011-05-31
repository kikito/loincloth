require 'helper'

module Test
  module LoinclothTests
    module Block
      class ToParagraph < Assertor::Case
        def should_convert_regular_text_to_paragraph
          should_convert "hello", "<p>hello</p>"
        end
        def should_not_convert_h1_text
          should_convert "hello\n===", "hello\n==="
        end
        def should_not_convert_h2_text
          should_convert "hello\n---", "hello\n---"
        end
        def should_not_convert_list_text
          should_convert "* hello \n* man", "* hello \n* man"
        end

        private
        
        def should_convert(source, expectation)
          block = Loincloth::Block.new source
          assert_equals(block.to_paragraph, expectation)
          assert_equals(block, expectation)
        end

      end
    end
  end
end
