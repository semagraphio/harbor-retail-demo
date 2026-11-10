package com.harbor.shipping;

import java.math.BigDecimal;

/** One order waiting to ship, as the shipping service reads it. */
public class OrderVo {
    private String id;
    private String shipCity;
    private BigDecimal totalAmount;

    public String getId() { return id; }
    public String getShipCity() { return shipCity; }
    public BigDecimal getTotalAmount() { return totalAmount; }
}
