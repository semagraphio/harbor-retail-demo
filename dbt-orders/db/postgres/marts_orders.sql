-- The Orders team's table definition for what dbt builds as marts.orders.
create table analytics.orders (
    order_id bigint not null,
    customer_id bigint,
    status text,
    ship_city text,
    paid_amount numeric(12, 2)
);

create view analytics.v_open_orders as
select order_id, status from analytics.orders where status <> 'closed';
