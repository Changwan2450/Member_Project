package com.kh.member_project.controller.api;

import com.kh.member_project.domain.Order;
import com.kh.member_project.service.OrderService.OrderService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/api/order")
@CrossOrigin(origins = "*", allowedHeaders = "*", methods = {RequestMethod.GET, RequestMethod.POST, RequestMethod.DELETE, RequestMethod.PUT})
// 아이패드 접속 허용
public class RestOrderController {

    private final OrderService orderService;

    // 주문하기 (Create)
    @PostMapping("/register")
    public String register(@RequestBody Order order) {
        orderService.register(order);
        return "success";
    }

    // 주문 내역 전체 조회 (Read)
    @GetMapping("/list")
    public List<Order> list() {
        return orderService.orderList();
    }

    // 주문 삭제 (Delete)
    @DeleteMapping("/delete/{ono}")
    public String delete(@PathVariable("ono") long ono) {
        orderService.deleteOrder(ono);
        return "success";
    }
}