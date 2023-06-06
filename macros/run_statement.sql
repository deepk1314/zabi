{% macro run_statement() %}
    

    
    {% set get_count %}
    select count(id)::int as cnt from {{ source('stripe', 'payment') }}
    {% endset %}
    {% set results = run_query(get_count) %}
    {% if execute %}
        
        {% set results_list = results.rows[0][0] %}
    {% else %} {% set results_list = [] %}
    {% endif %}
  {{results_list}}

{% endmacro %}
