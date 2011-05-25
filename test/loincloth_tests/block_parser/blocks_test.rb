require 'helper'

module Test
  module LoinclothTests
    module BlockParser

      class BlocksTest < Assertor::Case
      
        BLOCKS = [
          Loincloth::Block.new('first'),
          Loincloth::Block.new('second'),
          Loincloth::Block.new('third')
        ]

        def should_separate_by_nn
          try_text "first\n\nsecond\n\nthird"
        end

        def should_separate_by_nnn
          try_text "first\n\n\nsecond\n\n\nthird"
        end

        def should_separate_by_nr
          try_text "first\n\rsecond\n\rthird"
        end

        def should_separate_by_rn
          try_text "first\r\nsecond\r\nthird"
        end
        
        private
        
        def try_text(text)
          parser = Loincloth::BlockParser.new(text)
          assert_equals parser.blocks, BLOCKS
        end

      end

    end
  end
end

