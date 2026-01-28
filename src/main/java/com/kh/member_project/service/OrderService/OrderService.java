package com.kh.member_project.service.OrderService;
import com.kh.member_project.domain.Order;

import java.util.List;

public interface OrderService {
    public void register(Order order);
    public List<Order> orderList();
    public Order readOrder(int ono);
    public void deleteOrder(int ono);
}
