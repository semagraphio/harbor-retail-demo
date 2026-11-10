---
title: Store sales
---

# Store sales

```sql weekly
select fiscal_week, sum(revenue) as revenue
from warehouse.store_sales
group by fiscal_week
order by fiscal_week
```

<LineChart data={weekly} x=fiscal_week y=revenue />
