-- The store master as the web shop's MySQL database keeps it.
CREATE TABLE regions (
  region_id INT NOT NULL AUTO_INCREMENT,
  region_name VARCHAR(60) NOT NULL,
  PRIMARY KEY (region_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE stores (
  store_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  region_id INT NOT NULL,
  store_name VARCHAR(120) NOT NULL,
  opened_on DATE NULL,
  floor_m2 DECIMAL(8,1) NULL,
  PRIMARY KEY (store_id),
  KEY ix_stores_region (region_id),
  CONSTRAINT fk_stores_region FOREIGN KEY (region_id) REFERENCES regions (region_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE VIEW open_stores AS
SELECT s.store_id, s.store_name, r.region_name
FROM stores s
JOIN regions r ON r.region_id = s.region_id
WHERE s.opened_on IS NOT NULL;
