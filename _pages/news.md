---
layout: archive
title: "News"
permalink: /news/
author_profile: true
---

{% include base_path %}

{% for item in site.data.news %}
<p><strong>{{ item.date | date: "%B %d, %Y" }}</strong> – {{ item.text | markdownify | remove: "<p>" | remove: "</p>" }}</p>
{% endfor %}
