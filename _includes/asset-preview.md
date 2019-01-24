{% if include.count %}{% assign imgcount = include.count %}{% else %}{% assign imgcount = 1 %}{{
}}{% endif %}[![{{ include.alt }}]({{ site.baseurl }}/assets/{{ page.id | remove: '/' }}/{{
include.name }}-preview-{{ imgcount }}.jpeg){:width="{{ 800 | divided_by: imgcount | minus: 4
}}px"}]({{ site.baseurl }}/assets/{{ page.id | remove: '/' }}/{{ include.name }}.{{ include.ext }})