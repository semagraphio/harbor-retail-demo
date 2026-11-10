select
    p.order_id,
    p.paid_amount,
    p.paid_at
from {{ source('lake', 'bronze_payments') }} p
