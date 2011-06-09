require 'helper'
require 'stringio'

module Test
  module LoinclothTests
    module BlockParser

      class EachBlock < Assertor::Case
      
        BLOCKS = ['first', 'second', 'third']
        
        def should_return_empty_array_with_empty_string
          should_split "", []
        end
        
        def should_return_empty_array_with_newline_string
          should_split "\n", []
        end

        def should_separate_by_nn
          should_split BLOCKS.join "\n\n"
        end

        def should_separate_by_nnn
          should_split BLOCKS.join "\n\n\n"
        end
        
        def should_not_separate_by_n
          should_split BLOCKS.join("\n"), ["first\nsecond\nthird"]
        end
        
        def should_separate_appropiately
          should_split "first\nsecond\n\nthird", ["first\nsecond", "third"]
        end

        private
        
        def should_split(text, target=BLOCKS)
          parser = ::Loincloth::BlockParser.new(StringIO.new(text))
          blocks = []
          parser.each_block{|block| blocks << block }
          assert_equals blocks, target
        end

      end

    end
  end
end

