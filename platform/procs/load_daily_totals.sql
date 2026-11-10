-- Daily store totals in the SQL Server billing database, built through table variables.
CREATE TABLE dbo.store_payments (
    store_id int NOT NULL,
    paid_on date NOT NULL,
    amount decimal(18, 2) NOT NULL
);

CREATE TABLE dbo.daily_totals (
    store_id int NOT NULL,
    paid_on date NOT NULL,
    total decimal(18, 2) NOT NULL
);
GO

CREATE PROCEDURE dbo.load_daily_totals
AS
BEGIN
    DECLARE @rows TABLE (store_id int, paid_on date, amount decimal(18, 2));
    DECLARE @staged TABLE (store_id int, paid_on date, amount decimal(18, 2));
    DECLARE @adjustments TABLE (store_id int, delta decimal(18, 2));

    INSERT INTO @rows (store_id, paid_on, amount)
    SELECT store_id, paid_on, amount FROM dbo.store_payments;

    INSERT INTO @staged (store_id, paid_on, amount)
    SELECT store_id, paid_on, amount FROM @rows;

    INSERT INTO dbo.daily_totals (store_id, paid_on, total)
    SELECT s.store_id, s.paid_on, s.amount + a.delta
    FROM @staged s
    JOIN @adjustments a ON a.store_id = s.store_id;
END
