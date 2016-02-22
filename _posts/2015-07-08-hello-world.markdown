---
layout: post
title:  "Hello World"
date:   2015-07-08 23:44:03
categories: 无以聚类
comments: true
---

新注册了一个[域名](http://www.weinyc.com "人在纽约")，打算重新开始记录一些事情。 这次直接使用[Jekyll](https://github.com/jekyll/jekyll)，而不是之前的[Octopress](http://octopress.org/)，至少可以了解一下Jekyll的工作方式。  模板修改自[Freshman21](https://github.com/yulijia/freshman21/)，模板的版权为[MIT Licenses](http://choosealicense.com/licenses/mit/)。

整个Repository的结果如下：

* branch theme 存放主题文件
* branch posts 存放写的日志
* branch master, 使用git cherry-pick 获取theme和posts branches的更新

{% highlight shell linenos %}
$ git fetch origin theme:theme
$ git fetch origin posts:posts
$ git cherry-pick A..B 
# commits from A (not include) to B
# A^..B, A included
{% endhighlight %} 

下一步打算是考虑将pages放在一个单独的branch， 不过由于pages的更新比较少，也可能不会这么做。

{% highlight shell linenos %}
$ git checkout --orphan pages
# git remove all files except pages
$ git add --all
$ git commit -m "Initial branch pages"
$ git push origin pages
# in master branch
$ git checkout master
$ git fetch origin pages:pages
$ git cherry-pick A..B 
{% endhighlight %} 

原本打算使用`git submodule`的，只是配置要比分支复杂，随放弃了。 现在集中在使用`rake`来简化操作流程。 如果你喜欢这个结构，请`fork`。

> Stay Hungry Stay Foolish, Connect the Dots, I Have a Dream, Poor Little Rich Slum, and Follow Every Rainbow.