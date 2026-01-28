package com.kh.member_project.mapper;

import com.kh.member_project.domain.Order;
import org.apache.ibatis.annotations.Mapper;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Or;

import java.util.List;
@Mapper
public interface OrderMapper {
    void insertOrder(Order order);
    List<Order> getList();
    void deleteOrder(int ono);

}
