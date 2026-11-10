-- The dev copy of the loyalty balances table, in its own schema.
create or replace table loyalty_dev.point_balances (
    customer_id number,
    loyalty_tier varchar,
    points number(12, 0),
    refreshed_at timestamp_ntz
);

create or replace view loyalty_dev.gold_customers as
select customer_id, points from loyalty_dev.point_balances where loyalty_tier = 'gold';
