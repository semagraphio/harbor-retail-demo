select
    g.order_id,
    g.amount as refund_amount,
    cast(g.booked_at as date) as refund_date
from {{ source('ledger', 'gl_entries') }} g
where g.entry_type = 'refund'
