require 'helper'

module LoinclothTests

  module InstanceMethods

    class BlocksTest < Assertor::Case

      def should_separate_by_nn
        text = "first\n\nsecond\n\nthird"
        parser = Loincloth.new(text)
        assert_equals(parser.blocks, ['first', 'second', 'third'])
      end

      def should_separate_by_nnn
        text = "first\n\n\nsecond\n\n\nthird"
        parser = Loincloth.new(text)
        assert_equals(parser.blocks, ['first', 'second', 'third'])
      end

      def should_separate_by_nr
        text = "first\n\rsecond\n\rthird"
        parser = Loincloth.new(text)
        assert_equals(parser.blocks, ['first', 'second', 'third'])
      end

      def should_separate_by_rn
        text = "first\r\nsecond\r\nthird"
        parser = Loincloth.new(text)
        assert_equals(parser.blocks, ['first', 'second', 'third'])
      end

    end

  end

end

