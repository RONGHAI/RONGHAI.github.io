---
layout: page
title: 标签
permalink: /tags/
order: 21
---

{% if site.posts != empty %}
  <ul class="tags-box archive-group-list">
    <li>
      {% for tag in site.tags %}
        <a href="#{{ tag[0] }}" title="{{ tag[0] }}" rel="tag">{{ tag[0] }}<span class="size"> {{ tag[1].size }}</span></a>
      {% endfor %}
    </li>
  </ul>
  <ul class="tags-box archive-group-box">
    {% for tag in site.tags %}
          <li  id="{{ tag[0] }}">
              <span>{{ tag[0] }}</span>
              <ul class="archive-each-box">
                  {% for post in tag[1] %}
                  <li>
                    <time datetime="{{ post.date | date:"%Y-%m-%d" }}">{{ post.date | date:"%Y-%m-%d" }}</time> &raquo;
                    <a href="{{ site.baseurl }}{{ post.url }}" title="{{ post.title }}">{{ post.title }}</a>
                  </li>
                  {% endfor %}
              </ul> 
          </li>
      {% endfor %}
  </ul>
{% else %}  
    <ul class="tags-box">
      <li>{{ site.data.locales[site.default_locale].no_post }}</li>
    </ul>
{% endif %}