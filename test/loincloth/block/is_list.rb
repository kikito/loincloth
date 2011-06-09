require 'helper'

module Test
  module Loincloth
    module Block
      class IsParagraph < Assertor::Case
        def should_return_true_on_regular_text
          should_return_true_on "hello"
        end

        def should_return_true_on_h1_text
          should_return_false_on "hello\n==="
        end

        def should_return_true_on_h2_text
          should_return_false_on "hello\n---"
        end

        def should_return_true_on_list_text
          should_return_false_on "* hello"
        end

        private
        
        def should_return_true_on(text)
          block = ::Loincloth::Block.new text
          assert(block.is_paragraph?)
        end
        
        def should_return_false_on(text)
          block = ::Loincloth::Block.new text
          assert_not(block.is_paragraph?)
        end
        
      end
    end
  end
end
