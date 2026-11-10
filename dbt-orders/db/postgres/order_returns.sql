-- Returns, as the Postgres service database keeps them.
create table returns.order_returns (
    return_id bigint not null,
    order_id bigint not null,
    reason text,
    returned_at timestamp
);

create view returns.v_recent_returns as
select return_id, order_id from returns.order_returns where returned_at > now() - interval '30 days';
