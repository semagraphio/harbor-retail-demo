"""Reads the weekly rollup from Trino for the regional managers' email."""
import trino


def weekly_for_region(region_stores):
    conn = trino.dbapi.connect(host="trino.harbor.internal", port=443, user="reports", catalog="hive", schema="analytics")
    cur = conn.cursor()
    cur.execute("select store_id, week_start, revenue from hive.analytics.store_weekly")
    return [row for row in cur.fetchall() if row[0] in region_stores]
