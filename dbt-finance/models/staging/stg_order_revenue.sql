select
    o.order_id,
    cast(o.ordered_at as date) as revenue_date,
    o.total_amount,
    o.status,
    o.ship_city
from {{ source('orders', 'orders') }} o
