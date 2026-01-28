package com.kh.member_project.controller;

import com.kh.member_project.domain.Order;
import com.kh.member_project.service.OrderService.OrderService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@RequiredArgsConstructor
@Slf4j
@Controller
@RequestMapping("/order")
public class OrderController {

    private final OrderService orderService;

    @GetMapping("/orderRegister")
    public void registerOrder(@RequestParam("fno") int fno, Model model) {
        log.info("주문화면 로딩");
        model.addAttribute("fno", fno);
    }

    @PostMapping("/orderRegister")
    public String registerOrder(Order order) {
        log.info("주문 처리 시작: " + order);
        orderService.register(order); // db 담을 post
        return "redirect:/order/list";
    }

    @GetMapping("/list")
    public String orderList(Model model) {
        model.addAttribute("ol", orderService.orderList());
        return "order/list";
    }


}
