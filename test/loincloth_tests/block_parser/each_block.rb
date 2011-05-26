require 'helper'
require 'stringio'

module Test
  module LoinclothTests
    module BlockParser

      class EachBlock < Assertor::Case
      
        BLOCKS = ['first', 'second', 'third']
        
        def should_work_with_empty_strings
          test_text "", []
        end
        
        def should_work_with_line_separators_only
          test_text "\n", []
        end

        def should_separate_by_nn
          test_text BLOCKS.join "\n\n"
        end

        def should_separate_by_nnn
          test_text BLOCKS.join "\n\n\n"
        end
        
        def should_not_separate_by_n
          test_text BLOCKS.join("\n"), ["first\nsecond\nthird"]
        end
        
        def should_separate_appropiately
          test_text "first\nsecond\n\nthird", ["first\nsecond", "third"]
        end

        private
        
        def test_text(text, target=BLOCKS)
          parser = Loincloth::BlockParser.new(StringIO.new(text))
          blocks = []
          parser.each_block{|block| blocks << block }
          assert_equals blocks, target
        end

      end

    end
  end
end

