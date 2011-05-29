require 'helper'

module Test
  module LoinclothTests
    module Block
      class ToList < Assertor::Case
        def should_convert_to_list_a_one_line_list
          should_convert "* hello", "<ul>\n  <li>hello</li>\n</ul>"
        end
        def should_do_nothing_with_regular_text
          should_convert "hello", "hello"
        end
        def should_convert_to_2_li_list_with_two_stars
          should_convert "* hello\n* bye", "<ul>\n  <li>hello</li>\n  <li>bye</li>\n</ul>"
        end
        def should_convert_to_2_li_list_with_stars_in_the_middle
          should_convert "* hello * man\n * how \n* are \n you *", "<ul>\n  <li>hello * man\n * how </li>\n  <li>are \n you *</li>\n</ul>"
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
