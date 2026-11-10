{{ config(materialized='incremental', unique_key='order_item_id') }}

select
    i.order_item_id,
    i.order_id,
    i.product_id,
    i.quantity,
    i.unit_price,
    cast(i.quantity * i.unit_price as numeric(12, 2)) as line_amount
from {{ ref('stg_order_items') }} i
{% if is_incremental() %}
join {{ ref('stg_orders') }} o on o.order_id = i.order_id
where o.ordered_at > current_date - 3
{% endif %}
