require 'helper'

module Test
  module Loincloth
    module Block
      class Process < Assertor::Case

        def should_process_h1
          should_convert "Hello\n===", "<h1>Hello</h1>"
        end
        def should_process_h2
          should_convert "Hello\n---", "<h2>Hello</h2>"
        end
        def should_process_lists
          should_convert "* One\n* Two\n* Three", "<ul>\n  <li>One</li>\n  <li>Two</li>\n  <li>Three</li>\n</ul>"
        end
        def should_process_paragraphs
          should_convert "hello", "<p>hello</p>"
        end
        def should_process_strong_on_h1
          should_convert "I say **hello**\n===", "<h1>I say <strong>hello</strong></h1>"
        end
        def should_process_emphasis_on_lists
          should_convert "* *hello*", "<ul>\n  <li><em>hello</em></li>\n</ul>"
        end
        def should_process_images_and_links
          should_convert "An image: ![image](/images/image.jpg) and a [link](http://google.com).", "<p>An image: <img src=\"/images/image.jpg\" alt=\"image\" title=\"image\" /> and a <a href=\"http://google.com\" title=\"link\">link</a>.</p>"
        end


      private

        def should_convert(source, expectation)
          block = ::Loincloth::Block.new source
          block.process
          assert_equals(block, expectation)
        end

      end
    end
  end
end
