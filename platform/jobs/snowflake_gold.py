"""Lists gold loyalty customers for the marketing send."""
import snowflake.connector


def gold_customers():
    conn = snowflake.connector.connect(account="harbor-retail", user="marketing", warehouse="transform")
    cur = conn.cursor()
    cur.execute("select customer_id, points from loyalty.gold_customers order by points desc")
    return cur.fetchall()
