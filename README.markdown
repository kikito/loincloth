loincloth
=========

This gem parses a subset of MarkDown, in an inefficient way, both in terms of speed and memory. I call that subset PoloDown.

If you are thinking using this on a production environment ... well, I admire you. But I really think you should give the proper-MarkDown-parsing gems (Maruku, BlueCloth, etc) a look first.

Also, going to the doctor would not hurt.

Target
------

The target is being able to convert headers (level 1 and 2 only), paragraphs, lists (unordered, one level), emphasized text & strong text (stars only), links and images (inline only).


``` markdown
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

```

Should produce:

``` html
<h1>A First Level Header</h1>

<h2>A Second Level Header</h2>

<p>Now is the time for all <em>good</em> men to come to
the aid of <strong>their</strong> country. This is just a
regular paragraph</p>.

<ul>
  <li>Get socks</li>
  <li>Get milk</li>
  <li><a href="http://getfirefox.com">Get firefox</a></li>
</ul>

<p>
  <img src="/images/cat.jpg" alt="my cat playing with a ball" />
</p>
```

That's all.

Also, I'll be using UTF-8 on my tests. I can't guarantee it will handle other encodings properly.

Tests
-----

This gem uses my testing gem, [assertor](https://rubygems.org/gems/assertor), for tests.

Consider that a business requirement. Sorry.

Contributing to loincloth
-------------------------
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
---------

Copyright (c) 2011 Enrique García Cota. See LICENSE.txt for
further details.

