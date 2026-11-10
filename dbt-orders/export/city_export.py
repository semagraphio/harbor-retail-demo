from google.cloud import bigquery
def export_cities():
    client = bigquery.Client()
    client.query("""CREATE TABLE city_export AS
        SELECT ship_city, zone FROM `harbor.prod.shipping_zones`""")
