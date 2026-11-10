select
    sale_id,
    store_id,
    customer_id,
    cast(sold_at as date) as sale_date,
    amount
from {{ source('raw', 'store_sales') }}
where amount is not null
