from pyspark.sql import SparkSession
from pyspark.sql.functions import col
def land_payments(spark):
    df = spark.read.parquet("raw_payments")
    out = df.select(
        col("order_ref").alias("order_id"),
        col("payment_amount").alias("paid_amount"),
        col("captured_at").alias("paid_at"),
    )
    out.write.saveAsTable("bronze_payments")
