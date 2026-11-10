select
    o.order_id,
    o.customer_id,
    o.status,
    o.ship_city,
    o.ship_postcode,
    o.amount as total_amount,
    p.paid_amount,
    o.ordered_at,
    o.updated_at
from {{ ref('stg_orders') }} o
left join {{ ref('stg_payments') }} p on p.order_id = o.order_id
