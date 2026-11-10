select
    i.order_id,
    i.product_id,
    i.line_amount
from {{ source('orders', 'order_items') }} i
