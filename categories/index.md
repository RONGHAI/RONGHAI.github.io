---
layout: page
title: 目录
permalink: /categories/
order: 18
---

{% if site.posts != empty %}
  <ul class="tags-box archive-group-list">
    <li>
      {% for cat in site.tags %}
        <a href="#{{ cat[0] }}" title="{{ cat[0] }}" >{{ cat[0] }}<span class="size"> {{ cat[1].size }}</span></a>
      {% endfor %}
    </li>
  </ul>
  <ul class="tags-box archive-group-box">
    {% for cat in site.categories %}
          <li  id="{{ cat[0] }}">
              <span>{{ cat[0] }}</span>
              <ul class="archive-each-box">
                  {% for post in cat[1] %}
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
      <li>{{ site.locales[site.default_locale].no_post }}</li>
    </ul>
{% endif %}