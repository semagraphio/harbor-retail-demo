"""Builds the BigQuery copy of daily store sales, then reads it for the morning check."""
from google.cloud import bigquery

client = bigquery.Client()


def build_store_sales():
    client.query(
        "create or replace table analytics.store_sales_bq as "
        "select store_id, sale_date, revenue from analytics.daily_store_sales"
    ).result()


def morning_check():
    rows = client.query("select store_id, revenue from analytics.store_sales_bq where revenue = 0").result()
    return [r.store_id for r in rows]
