import sqlite3
def order_status(conn):
    return conn.execute("SELECT order_id, status, paid_amount FROM orders")
def zone_counts(conn):
    return conn.execute("SELECT zone, order_count FROM shipping_zones WHERE order_count > 0")
