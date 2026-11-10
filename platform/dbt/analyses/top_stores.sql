-- The ten stores with the most revenue last week, for the Monday review.
select store_id, sum(revenue) as revenue
from {{ ref('daily_store_sales') }}
where sale_date >= current_date - 7
group by store_id
order by revenue desc
limit 10
