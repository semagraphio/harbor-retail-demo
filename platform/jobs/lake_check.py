"""Checks the lake answers before the nightly load starts."""
import duckdb


def lake_ready():
    con = duckdb.connect()
    con.execute("select count(*) from read_parquet('s3://harbor-lake/store_sales/*.parquet')")
    return con.execute("select table_name from information_schema.tables").fetchall()
