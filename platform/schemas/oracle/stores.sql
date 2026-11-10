-- The store master in the Oracle back office.
CREATE SEQUENCE store_seq START WITH 1 INCREMENT BY 1;

CREATE TABLE regions (
    region_id   NUMBER(6)      NOT NULL,
    region_name VARCHAR2(60)   NOT NULL,
    CONSTRAINT pk_regions PRIMARY KEY (region_id)
);

CREATE TABLE stores (
    store_id    NUMBER(10)     DEFAULT store_seq.NEXTVAL NOT NULL,
    region_id   NUMBER(6)      NOT NULL,
    store_name  VARCHAR2(120)  NOT NULL,
    opened_on   DATE,
    floor_m2    NUMBER(8, 1),
    CONSTRAINT pk_stores PRIMARY KEY (store_id),
    CONSTRAINT fk_stores_region FOREIGN KEY (region_id) REFERENCES regions (region_id)
);

CREATE INDEX ix_stores_region ON stores (region_id);

CREATE OR REPLACE VIEW open_stores AS
SELECT s.store_id, s.store_name, r.region_name
FROM stores s
JOIN regions r ON r.region_id = s.region_id
WHERE s.opened_on IS NOT NULL;
