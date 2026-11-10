-- Weekly store rollup, run in Trino over the lake copy of the sales table.
create table hive.analytics.store_weekly as
select
    store_id,
    date_trunc('week', sale_date) as week_start,
    sum(revenue) as revenue,
    approx_distinct(sale_date) as trading_days
from hive.analytics.daily_store_sales
group by 1, 2;
