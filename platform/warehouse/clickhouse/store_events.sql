-- Till events land in ClickHouse; a materialized view keeps hourly totals.
CREATE TABLE events.till_events
(
    event_time DateTime,
    store_id UInt32,
    till_id UInt16,
    amount Decimal(12, 2)
)
ENGINE = MergeTree
PARTITION BY toYYYYMM(event_time)
ORDER BY (store_id, event_time);

CREATE TABLE events.store_hourly
(
    hour DateTime,
    store_id UInt32,
    revenue Decimal(18, 2)
)
ENGINE = SummingMergeTree
ORDER BY (store_id, hour);

CREATE MATERIALIZED VIEW events.store_hourly_mv TO events.store_hourly AS
SELECT toStartOfHour(event_time) AS hour, store_id, sum(amount) AS revenue
FROM events.till_events
GROUP BY hour, store_id;
