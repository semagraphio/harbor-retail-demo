select
    refund_date,
    sum(refund_amount) as refunds
from {{ ref('stg_refunds') }}
group by refund_date
