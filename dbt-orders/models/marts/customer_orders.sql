select
    c.customer_id,
    c.email,
    count(o.order_id) as order_count,
    sum(o.total_amount) as lifetime_amount,
    max(o.ordered_at) as last_ordered_at
from {{ ref('stg_customers') }} c
left join {{ ref('orders') }} o on o.customer_id = c.customer_id
group by c.customer_id, c.email
