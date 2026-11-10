{% snapshot customers_snapshot %}
{{ config(target_schema='snapshots', unique_key='customer_id', strategy='check', check_cols=['email', 'loyalty_tier']) }}
select customer_id, email, loyalty_tier, updated_at
from {{ source('raw', 'customers') }}
{% endsnapshot %}
