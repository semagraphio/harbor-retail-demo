package com.harbor.shipping;

import java.util.List;
import org.apache.ibatis.session.SqlSession;

/** Builds the day's shipping queue for the warehouse. The queries are in mappers/OrderMapper.xml. */
public class ShippingService {
    private final OrderMapper orders;
    private final SqlSession session;

    public ShippingService(OrderMapper orders, SqlSession session) {
        this.orders = orders;
        this.session = session;
    }

    public List<OrderVo> shippingQueue() {
        // through the mapper interface, as Spring code calls it
        List<OrderVo> queue = orders.selectShippingQueue();
        // and by the statement's full name, as older code does
        Integer open = session.selectOne("com.harbor.shipping.OrderMapper.countOpenOrders");
        if (open == null || open == 0) {
            return List.of();
        }
        return queue;
    }
}
