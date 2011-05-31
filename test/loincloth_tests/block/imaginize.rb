require 'helper'

module Test
  module LoinclothTests
    module Block
      class Imaginize < Assertor::Case
      
        def should_leave_regular_text_untouched
          should_convert "hello", "hello"
        end
      
        def should_convert_regular_images
          should_convert "![an image](/images/cat.jpg)", "<img src=\"/images/cat.jpg\" alt=\"an image\" title=\"an image\" />"
        end
        
        def should_convert_regular_images_inside_text 
          should_convert "this is an image ![an image](/image/cat.jpg) inside text", "this is an image <img src=\"/image/cat.jpg\" alt=\"an image\" title=\"an image\" /> inside text"
        end
       
        def should_convert_multiple_links_inside_text
          should_convert "this is an image ![an image](/images/cat.jpg) and another ![another image](/images/dog.jpg) inside text", "this is an image <img src=\"/images/cat.jpg\" alt=\"an image\" title=\"an image\" /> and another <img src=\"/images/dog.jpg\" alt=\"another image\" title=\"another image\" /> inside text"
        end
        
        private
        
        def should_convert(source, expectation)
          block = Loincloth::Block.new source
          block.imaginize
          assert_equals(block, expectation)
        end

      end
    end
  end
end
