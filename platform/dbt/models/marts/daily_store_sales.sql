-- The calendar comes from the shared calendar package, which lives outside this repository.
select
    s.store_id,
    s.sale_date,
    d.fiscal_week,
    count(*) as sales,
    sum(s.amount) as revenue
from {{ ref('stg_store_sales') }} s
join {{ ref('calendar', 'dim_date') }} d on d.date_day = s.sale_date
group by s.store_id, s.sale_date, d.fiscal_week
