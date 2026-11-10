select
    o.status,
    l.label as status_label,
    count(*) as order_count
from {{ ref('orders') }} o
left join {{ ref('status_labels') }} l on l.status = o.status
group by o.status, l.label
