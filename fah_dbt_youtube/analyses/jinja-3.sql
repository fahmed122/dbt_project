{% set inc_flag = 1  %}
{% set last_load = 3 %}
{# set of specific column to pull#}
{% set col_list = "sales_id","date_sk","gross_amount"  %}

SELECT 
 {% for i in col_list -%}
    {{ i }}
    {%- if not loop.last -%} , {% endif %}
 {% endfor %}

FROM {{ ref('bronze_sales') }}

{# incremental load #}
{% if inc_flag  == 1 %}

    WHERE date_sk > {{last_load}} {# last_load is a var and date_sk is a column #}
{% endif %}