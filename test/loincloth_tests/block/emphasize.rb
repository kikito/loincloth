require 'helper'

module Test
  module LoinclothTests
    module Block
      class Emphasize < Assertor::Case
        def should_not_transform_regular_text
          should_convert "hello", "hello"
        end
        
        def should_transform_star_text_star_into_emphasized_html
          should_convert "hello *this* rules", "hello <em>this</em> rules"
        end
        
        def should_not_transform_star_text_with_spaces_star_into_emphasized_html
          should_convert "hello *this too* rules", "hello <em>this too</em> rules"
        end
        
        def should_work_with_multiple_words
          should_convert "*hello*, you *handsome*", "<em>hello</em>, you <em>handsome</em>"
        end
        
        private
        
        def should_convert(source, expectation)
          block = Loincloth::Block.new source
          block.emphasize
          assert_equals(block, expectation)
        end
      end
    end
  end
end

