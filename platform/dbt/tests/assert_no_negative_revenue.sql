select store_id, sale_date, revenue
from {{ ref('daily_store_sales') }}
where revenue < 0
