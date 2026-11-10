select
    m.id as customer_id,
    {{ clean_email('m.email') }} as email,
    m.create_time as signed_up_at
from {{ source('oms', 'oms_member') }} m
