---
layout: post
title: "How To Create A Git Blob Using Ruby"
date: 2012-12-07 20:25
comments: true
categories: 编程随记
---

{% highlight ruby linenos %}
#!/bin/env ruby
require 'digest/sha1'
require 'zlib'
require 'fileutils'
#content
content =  IO.read(filename)
#create header start with 'blob ' and content length and end with NULL ('\0')
header = "blob #{content.length}\0"
#combine header and content
store = header + content
#create SHA1 hash
sha1 = Digest::SHA1.hexdigest(store)
#create file, the first 2 letters are floder and the left is file name
path = '.git/objects/' << sha1[0,2] << '/' << sha1[2,38]
FileUtils.mkdir_p(File.dirname(path))
#using zlib to compress store content
zlib_content = Zlib::Deflate.deflate(store)
#write to file
File.open(path, 'w') {|f| f.write zlib_content}
#inflate compressed content.
#puts Zlib::Inflate.inflate(IO.read(filename)).inspect
{% endhighlight %}

[Backgroud information is here](http://git-scm.com/book/zh/Git-%E5%86%85%E9%83%A8%E5%8E%9F%E7%90%86-Git-%E5%AF%B9%E8%B1%A1 "Backgroud information is here.")
