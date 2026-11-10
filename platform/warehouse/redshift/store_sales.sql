-- The Redshift copy of store sales, spread by store and sorted by day, unloaded nightly for the auditors.
create table finance.store_sales_rs (
    store_id integer not null,
    sale_date date not null,
    revenue numeric(18, 2) not null default 0,
    primary key (store_id, sale_date)
)
diststyle key
distkey (store_id)
sortkey (sale_date);

insert into finance.store_sales_rs (store_id, sale_date, revenue)
select store_id, sale_date, revenue
from analytics.daily_store_sales;

unload ('select store_id, sale_date, revenue from finance.store_sales_rs')
to 's3://harbor-audit/store_sales/'
iam_role 'arn:aws:iam::000000000000:role/harbor-unload'
format as parquet;
