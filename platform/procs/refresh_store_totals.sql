-- Nightly store totals in the Postgres operations database, built through a temp table.
CREATE TABLE ops.store_totals (
    store_id integer PRIMARY KEY,
    revenue numeric(18, 2) NOT NULL,
    refreshed_at timestamptz NOT NULL
);

CREATE OR REPLACE FUNCTION ops.refresh_store_totals() RETURNS void
LANGUAGE plpgsql AS $$
BEGIN
    CREATE TEMP TABLE tmp_totals ON COMMIT DROP AS
    SELECT store_id, sum(amount) AS revenue
    FROM raw.store_sales
    GROUP BY store_id;

    DELETE FROM ops.store_totals;

    INSERT INTO ops.store_totals (store_id, revenue, refreshed_at)
    SELECT store_id, revenue, now()
    FROM tmp_totals;
END;
$$;
