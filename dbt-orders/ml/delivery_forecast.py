from snowflake.snowpark import Session
from snowflake.snowpark.functions import col
def build_features(session):
    orders = session.table("orders")
    feats = orders.select(
        col("ship_city").as_("city"),
        col("paid_amount").as_("order_value"),
    )
    feats.write.save_as_table("delivery_features")
def predict(session):
    df = session.table("delivery_features")
    df.select(col("city").as_("city"), col("order_value").as_("late_risk")) \
      .write.save_as_table("late_delivery_scores")
