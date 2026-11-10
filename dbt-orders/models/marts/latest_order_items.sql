-- The newest row per order line, written with a package macro.
{{ dbt_utils.deduplicate(
    relation=ref('stg_order_items'),
    partition_by='order_id, product_id',
    order_by='order_item_id desc'
) }}
