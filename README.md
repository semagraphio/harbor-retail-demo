# Harbor Retail demo

The code behind the demo at [semagraph.io](https://www.semagraph.io/demo/). Harbor Retail is a made-up company. Every name, address and account in this repository is invented. Each file is a short example of a pattern real teams use, not a working system.

Semagraph reads this code and draws column lineage across all three projects, from the order service's tables to the finance dashboards.

| Folder | Holds |
|---|---|
| `dbt-orders` | The Orders team's dbt project, with Python, PySpark, Snowpark, Java (MyBatis), TypeScript and notebook code that reads or builds its tables |
| `dbt-finance` | The Finance team's dbt project, which reads the orders tables, plus Lightdash charts and a dashboard |
| `platform` | A small dbt project for store sales, beside warehouse SQL (Snowflake, Redshift, ClickHouse, Trino), jobs, schemas (MySQL, Oracle), an Evidence dashboard and stored procedures |
| `branches` | Two example changes as patches, used to show impact analysis |

For a full-featured demo, book one at [semagraph.io](https://www.semagraph.io).
