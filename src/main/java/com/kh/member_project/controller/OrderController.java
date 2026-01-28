package com.kh.member_project.controller;

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
        // 1. 세션에서 로그인 정보 꺼내기
        // 로그인할 때 세션에 담았던 객체 타입(Member 혹은 VO)으로 형변환
        Object loginUser = session.getAttribute("loginUser");
        if (loginUser != null) {
            // 형의 Member 객체 구조에 맞춰서 ID 추출 (예: Member 클래스의 getId())
            // 만약 Member 클래스가 아니라면 상황에 맞게 id를 꺼내서 넣어줘 형!
            com.kh.member_project.domain.Member member = (com.kh.member_project.domain.Member) loginUser;
            order.setId(member.getId());
        } else {
            // 로그인 안 된 상태면 로그인 페이지로 쫓아내기 (안전장치)
            log.info("로그인 안함;;");
            return "redirect:/member/login";
        }

        log.info("DB로 던지기 직전 데이터: " + order); // 여기서 id가 들어있는지 확인해봐!
        orderService.register(order);

        return "redirect:/order/list";
    }

    @GetMapping("/list")
    public String orderList(Model model) {
        model.addAttribute("ol", orderService.orderList());
        return "order/list";
    }

}
