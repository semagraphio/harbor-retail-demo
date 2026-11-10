-- dedupe_by comes from a package this project installs with dbt deps
{{ dedupe_by('stg_orders', 'order_id', 'updated_at') }}
