-- The same returns table, as the Snowflake copy declares it.
create or replace table returns.order_returns (
    return_id number,
    order_id number,
    reason varchar,
    returned_at timestamp_ntz,
    refund_amount number(12, 2)
);

create or replace view returns.v_refunded_returns as
select return_id, refund_amount from returns.order_returns where refund_amount > 0;
