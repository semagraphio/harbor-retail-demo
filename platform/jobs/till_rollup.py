"""Rolls the day's sales up per store through a temp table, then keeps the result as a table."""
import duckdb


def stage_tills(con: duckdb.DuckDBPyConnection):
    con.execute("create temp table nid as select store_id, sum(revenue) as rev from analytics.daily_store_sales group by store_id")
    con.execute("create table analytics.till_totals as select store_id, rev from nid")
