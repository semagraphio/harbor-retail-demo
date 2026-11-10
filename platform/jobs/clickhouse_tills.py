"""Pushes till events from the store gateway into ClickHouse."""
import clickhouse_connect


def load_tills(batch):
    client = clickhouse_connect.get_client(host="clickhouse.harbor.internal")
    client.insert("events.till_events", batch, column_names=["event_time", "store_id", "till_id", "amount"])
    return client.query("select count() from events.store_hourly").result_rows
