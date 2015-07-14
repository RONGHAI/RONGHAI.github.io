---
layout: page
title: 存档
permalink: /archives/
---

{% if site.posts != empty %}
  <ul class="tags-box archive-group-box">
    {% for post in site.posts %}
      {% capture this_year %}{{ post.date | date: "%Y" }}{% endcapture %}
      {% unless year == this_year %}
        {% assign year = this_year %}
        {% unless post == site.posts.first %}
        {% endunless %}
        {% assign list_li = true %}
      {% else %}
        {% assign list_li = false %}
      {% endunless %}
      <!-- -->
      {% if list_li %}
          <li  id="{{ year }}">
            <span>{{ year }}</span>
            <ul class="archive-each-box">
      {% endif %}
          <li>
            <time datetime="{{ post.date | date:"%Y-%m-%d" }}">{{ post.date | date:"%Y-%m-%d" }}</time> &raquo;
            <a href="{{ site.baseurl }}{{ post.url }}" title="{{ post.title }}">{{ post.title }}</a>
          </li>
      {% if list_li %}
            </ul>
          </li>
      {% endif %}
    {% endfor %}
  </ul>
{% else %}  
    <ul class="tags-box">
      <li>{{ "no_post" | localize }}</li>
    </ul>
{% endif %}