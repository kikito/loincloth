require 'helper'

module Test
  module Loincloth
    module Block
      class Strongize < Assertor::Case
        def should_not_transform_regular_text
          should_convert "hello", "hello"
        end
        
        def should_transform_star_text_star_into_emphasized_html
          should_convert "hello **this** rules", "hello <strong>this</strong> rules"
        end
        
        def should_not_transform_star_text_with_spaces_star_into_emphasized_html
          should_convert "hello **this too** rules", "hello <strong>this too</strong> rules"
        end
        
        def should_work_with_multiple_words
          should_convert "**hello**, you **handsome**", "<strong>hello</strong>, you <strong>handsome</strong>"
        end
        
        private
        
        def should_convert(source, expectation)
          block = ::Loincloth::Block.new source
          block.strongize
          assert_equals(block, expectation)
        end
      end
    end
  end
end

