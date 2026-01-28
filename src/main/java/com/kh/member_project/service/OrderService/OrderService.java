package com.kh.member_project.service.OrderService;
import com.kh.member_project.domain.Order;

import java.util.List;

public interface OrderService {
     void register(Order order);
     List<Order> orderList();
     Order readOrder(int ono);
     void deleteOrder(int ono);
}
