select
    r.order_id,
    r.revenue_date,
    r.ship_city,
    r.total_amount - coalesce(f.refund_amount, 0) as net_revenue,
    l.line_count
from {{ ref('stg_order_revenue') }} r
left join {{ ref('stg_refunds') }} f on f.order_id = r.order_id
left join (
    select order_id, count(*) as line_count from {{ ref('stg_order_lines') }} group by order_id
) l on l.order_id = r.order_id
where r.status <> 'canceled'
