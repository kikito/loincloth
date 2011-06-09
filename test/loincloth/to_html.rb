require 'helper'

module Test
  module Loincloth
    class ToHtml < Assertor::Case
      INPUT = <<-eos
A First Level Header
====================

A Second Level Header
---------------------

Now is the time for all *good* men to come to
the aid of **their** country. This is just a
regular paragraph.

* Get socks
* Get milk
* [Get firefox](http://getfirefox.com)

![my cat playing with a ball](/images/cat.jpg)
      eos

      OUTPUT = <<-eos

<h1>A First Level Header</h1>

<h2>A Second Level Header</h2>

<p>Now is the time for all <em>good</em> men to come to
the aid of <strong>their</strong> country. This is just a
regular paragraph.</p>

<ul>
  <li>Get socks</li>
  <li>Get milk</li>
  <li><a href="http://getfirefox.com" title="Get firefox">Get firefox</a></li>
</ul>

<p><img src="/images/cat.jpg" alt="my cat playing with a ball" title="my cat playing with a ball" /></p>
      eos

      def works_with_stream_stream
        output = StringIO.new
        ::Loincloth.new(StringIO.new(INPUT)).to_html output
        assert_equals(output.string, OUTPUT)
      end

      def works_with_string_string
        assert_equals(::Loincloth.new(INPUT).to_html, OUTPUT)
      end

      def works_with_string_stream
        output = StringIO.new
        ::Loincloth.new(INPUT).to_html output
        assert_equals(output.string, OUTPUT)
      end

      def works_with_stream_string
        assert_equals(::Loincloth.new(StringIO.new(INPUT)).to_html, OUTPUT)
      end

    end
  end
end
