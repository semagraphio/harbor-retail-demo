-- Loyalty points in Snowflake: a stream on the snapshot feeds a task that fills the balances table.
create or replace table loyalty.point_balances (
    customer_id number,
    loyalty_tier varchar,
    points number(12, 0),
    refreshed_at timestamp_ntz
);

create or replace stream loyalty.customer_changes on table snapshots.customers_snapshot;

create or replace task loyalty.refresh_balances
  warehouse = transform
  schedule = '60 minute'
as
  merge into loyalty.point_balances b
  using (select customer_id, loyalty_tier from loyalty.customer_changes) c
  on b.customer_id = c.customer_id
  when matched then update set loyalty_tier = c.loyalty_tier, refreshed_at = current_timestamp()
  when not matched then insert (customer_id, loyalty_tier, points, refreshed_at) values (c.customer_id, c.loyalty_tier, 0, current_timestamp());

create or replace view loyalty.gold_customers as
select customer_id, points
from loyalty.point_balances
where loyalty_tier = 'gold';
