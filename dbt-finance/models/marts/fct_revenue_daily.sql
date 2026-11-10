select
    revenue_date,
    sum(net_revenue) as revenue,
    count(*) as order_count
from {{ ref('fct_order_revenue') }}
group by revenue_date
