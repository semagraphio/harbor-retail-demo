{% macro audit_of(name) %}
    (select *, current_timestamp as audited_at from {{ ref(name) }})
{% endmacro %}
