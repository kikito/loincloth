require 'helper'

module Test
  module LoinclothTests
    module Block
      class ToList < Assertor::Case
        def should_convert_to_list_a_one_line_list
          should_convert "* hello", "<ul><li>hello</li></ul>"
        end
        def should_do_nothing_with_regular_text
          should_convert "hello", "hello"
        end
        def should_convert_to_2_li_list_with_two_stars
          should_convert "* hello\n* bye", "<ul><li>hello</li><li>bye</li></ul>"
        end

        private
        
        def should_convert(source, expectation)
          block = Loincloth::Block.new source
          assert_equals(block.to_list, expectation)
          assert_equals(block, expectation)
        end

      end
    end
  end
end
