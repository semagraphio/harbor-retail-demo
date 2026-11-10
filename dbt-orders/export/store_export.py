from google.cloud import bigquery
def export_store_sales():
    client = bigquery.Client()
    client.query("""CREATE TABLE store_export AS
        SELECT store_id, revenue FROM `analytics.platform.daily_store_sales`""")
