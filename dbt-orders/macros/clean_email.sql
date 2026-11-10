{% macro clean_email(column) %}
    lower(trim({{ column }}))
{% endmacro %}
