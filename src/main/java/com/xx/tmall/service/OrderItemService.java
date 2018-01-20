package com.xx.tmall.service;

import com.xx.tmall.pojo.Order;
import com.xx.tmall.pojo.OrderItem;

import java.util.List;

public interface OrderItemService {

    List list();
    void add(OrderItem orderItem);
    void delete(int id);
    OrderItem get(int id);
    void update(OrderItem orderItem);

    void fill(List<Order> os);
    void fill(Order o);
}
