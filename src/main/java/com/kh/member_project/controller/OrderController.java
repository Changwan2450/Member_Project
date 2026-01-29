package com.kh.member_project.controller;

import com.kh.member_project.domain.Member;
import com.kh.member_project.domain.Order;
import com.kh.member_project.service.OrderService.OrderService;
import jakarta.servlet.http.HttpSession;
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
    public String registerOrder(Order order, HttpSession session) {

        log.info("주문 처리 시작: " + order);
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser != null) {
            order.setId(loginUser.getId());
        } else {
            return "redirect:/member/login";
        }

        log.info("DB로 던지기 직전 데이터: " + order);
        orderService.register(order);

        return "redirect:/order/list";
    }

    @GetMapping("/list")
    public String orderList(Model model) {
        log.info("주문내역 출력중");
        model.addAttribute("ol", orderService.orderList());
        return "order/list";
    }

    @GetMapping("/delete")
    public String deleteOrder(@RequestParam("ono") long ono) {
        orderService.deleteOrder(ono);
        return "redirect:/order/list";
    }
}
