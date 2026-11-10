select
    ship_city,
    case
        when ship_postcode like '1%' then 'north'
        when ship_postcode like '2%' then 'central'
        else 'south'
    end as zone,
    count(*) as order_count
from {{ ref('orders') }}
group by 1, 2
