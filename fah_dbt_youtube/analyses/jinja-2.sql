{%- set apples = ["Fuji", "Gala", "Honeycrisp", "Granny Smith", "Red Delicious", "McIntosh"] -%}

{%- for i in apples -%}
    
    {% if i!= "McIntosh" %}

        {{ i }}
    {% else %}    
     I hate {{  i }}
    {% endif %}
{% endfor %}    