{% macro convert_date(in_date,format) %}
to_varchar({{in_date}},'{{format}}')
    
{% endmacro %}