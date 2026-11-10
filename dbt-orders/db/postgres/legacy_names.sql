-- An old import created a mixed-case table beside the lower-case one.
create table legacy."Orders" (
    "OrderId" bigint not null,
    "Status" text
);

create table legacy.orders (
    order_id bigint not null,
    status text
);

create view legacy.v_legacy_status as
select o."OrderId", n.status from legacy."Orders" o join legacy.orders n on n.order_id = o."OrderId";
