package com.kh.member_project.controller;

import com.kh.member_project.domain.Food;
import com.kh.member_project.domain.Member;
import com.kh.member_project.service.FoodService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/food")
public class FoodController {
    private final FoodService foodService;
    private final SqlSession sqlSession;

    // 0. 음식 리스트 출력
    @GetMapping("/list")
    public String foodList(Model model) {
        log.info("음식 리스트 출력,,");
        model.addAttribute("list", foodService.getFoodList());
        return "food/list";
    }

    // 1. 등록 폼 화면 띄우기
    @GetMapping("/register")
    public void registerForm() {
        log.info("음식 등록 화면으로 이동,,");
    }

    // 2. DB에 저장하기
    @PostMapping("/register")
    public String register(Food food, HttpSession hs) {
        log.info("음식 등록 처리: {}, 세션등록: {}", food, hs); // 로그는 맨 위에 찍는 게 국룰!

        // 1. 세션(사물함)에서 로그인한 유저 정보 꺼내기
        Member user = (Member) hs.getAttribute("loginUser");

        // 2. 로그인 상태라면, 그 유저의 ID를 음식 객체에 작성자로 세팅
        if (user != null) {
            log.info("등록자 아이디 확인");
            food.setMemberId(user.getId());
        } else {
            // [꿀팁] 로그인 안 했으면 등록 못 하게 로그인 페이지로 튕기기
            log.info("로그인 안 된 사용자");
            return "redirect:/member/login";
        }

        // 3. 이제 정보가 꽉 찬 food 객체를 DB에 저장
        foodService.addFood(food);

        return "redirect:/food/list";
    }

    @GetMapping("/delete")
    public String deleteFood(long foodId) {
        log.info("회 원 삭 제 중,,");
        foodService.deleteFood(foodId);
        return "redirect:/food/list";
    }

    @GetMapping("/update")
    public String updateFood(Model model, long foodId) {
        log.info("회 원 수 정 페이지");
        model.addAttribute("update", foodService.readFood(foodId));
        return "food/update";
    }

    @PostMapping("/update")
    public String updateFood(Food food) {
        log.info("회 원 수 정 중 : {}", food);
        foodService.updateFood(food);
        return "redirect:/food/list";
    }

}
