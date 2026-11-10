# Databricks notebook source
# MAGIC %md ## Operations daily

# COMMAND ----------

# MAGIC %sql
# MAGIC CREATE TABLE ops_daily AS
# MAGIC SELECT status, order_count FROM orders_by_status

# COMMAND ----------

# MAGIC %md done
