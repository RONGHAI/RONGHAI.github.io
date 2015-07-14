---
layout: post
title:  "主题更新"
date:   2015-07-13 23:02:15
categories: 编程随记
comments: true
---

这两天把主题Freshman21做了一些更新，当然由于项目并没有fork原始的repo，而且我的修改和原始的master已经有很大差别，所以主题文件依然存放在自己项目分支下。

{% highlight Bash shell scripts%}
git clone https://github.com/ronghai/ronghai.github.io.git -b theme --single-branch
{% endhighlight %}

主要做了下面一些改动

* 增加Google Analytics的支持
* i18n的简易实现， 对Jekyll plugins的简单运用
* 从`_config.xml` 分离 i18n 和 blogroll 配置，将分离后的相关文件放到`_data`目录下面
* html5 validation  目前所有页面都可以通过 [html5 验证](https://validator.w3.org/)
