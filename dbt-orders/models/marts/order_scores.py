def model(dbt, session):
    orders = dbt.ref("orders")
    return orders.select("order_id", "total_amount")
