select
    r.revenue_date,
    r.revenue,
    coalesce(f.refunds, 0) as refunds,
    r.revenue - coalesce(f.refunds, 0) as margin
from {{ ref('fct_revenue_daily') }} r
left join {{ ref('fct_refunds_daily') }} f on f.refund_date = r.revenue_date
