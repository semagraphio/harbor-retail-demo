package com.harbor.shipping;

import java.util.List;

/** The shipping queries, bound by MyBatis to mappers/OrderMapper.xml through this interface's full name. */
public interface OrderMapper {
    List<OrderVo> selectShippingQueue();

    int countOpenOrders();
}
