package com.kh.member_project.service.OrderService;

import com.kh.member_project.domain.Order;
import com.kh.member_project.mapper.OrderMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class OrderServiceImpl implements OrderService {

    private final OrderMapper OrderMapper;

    @Override
    public void register(Order order) {
        OrderMapper.insertOrder(order);
    }

    @Override
    public List<Order> orderList() {

        return OrderMapper.getList();
    }

    @Override
    public Order readOrder(int ono) {

        return OrderMapper.readOrder(ono);
    }

    @Override
    public void deleteOrder(int ono) {
        OrderMapper.deleteOrder(ono);
    }

}
