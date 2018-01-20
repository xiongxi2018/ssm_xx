package com.xx.tmall.service;

import com.xx.tmall.pojo.Order;
import org.aspectj.weaver.ast.Or;

import java.util.List;

public interface OrderService {

    String waitPay = "waitPay";
    String waitDelivery = "waitDelivery";
    String waitConfirm = "waitConfirm";
    String waitReview = "waitReview";
    String finish = "finish";
    String delete = "delete";

    List<Order> list();
    void add(Order order);
    void delete(int id);
    Order get(int id);
    void update(Order order);
}
