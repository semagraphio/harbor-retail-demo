select
    o.id as order_id,
    o.member_id as customer_id,
    o.pay_amount as amount,
    case o.status
        when 0 then 'placed'
        when 1 then 'paid'
        when 2 then 'shipped'
        when 3 then 'delivered'
        else 'canceled'
    end as status,
    o.receiver_city as ship_city,
    o.receiver_postcode as ship_postcode,
    o.create_time as ordered_at,
    o.modify_time as updated_at
from {{ source('oms', 'oms_order') }} o
