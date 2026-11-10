select
    i.id as order_item_id,
    i.order_id,
    i.product_id,
    i.product_quantity as quantity,
    i.product_price as unit_price
from {{ source('oms', 'oms_order_item') }} i
