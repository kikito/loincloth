require 'helper'

module Test
  module LoinclothTests
    module Block
      class Link < Assertor::Case
      
        def should_leave_regular_text_untouched
          should_convert "hello", "hello"
        end
      
        def should_convert_regular_links
          should_convert "[link to google](http://www.google.com)", "<a href=\"http://www.google.com\" title=\"link to google\">link to google</a>"
        end
        
        def should_convert_regular_links_inside_text 
          should_convert "this is a [link to google](http://www.google.com) inside text", "this is a <a href=\"http://www.google.com\" title=\"link to google\">link to google</a> inside text"
        end
        
        def should_convert_multiple_links_inside_text
          should_convert "this is a [link to google](http://www.google.com) and a [link to github](http://www.github.com) inside text", "this is a <a href=\"http://www.google.com\" title=\"link to google\">link to google</a> and a <a href=\"http://www.github.com\" title=\"link to github\">link to github</a> inside text"
        end
        
        private
        
        def should_convert(source, expectation)
          block = Loincloth::Block.new source
          block.link
          assert_equals(block, expectation)
        end

      end
    end
  end
end
