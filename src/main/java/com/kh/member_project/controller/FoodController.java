package com.kh.member_project.controller;

import com.kh.member_project.domain.Food;
import com.kh.member_project.domain.Member;
import com.kh.member_project.service.FoodService.FoodService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
        model.addAttribute("foodList", foodService.getFoodList());
        return "food/list";
    }

    // 1. 등록 폼 화면 띄우기
    @GetMapping("/register")
    public void registerForm() {
    }

    // 2. DB에 저장하기
    @PostMapping("/register")
    public String register(Food food, HttpSession hs) {

        // 1. 세션(사물함)에서 로그인한 유저 정보 꺼내기
        Member user = (Member) hs.getAttribute("loginUser");

        // 2. 로그인 상태라면, 그 유저의 ID를 음식 객체에 작성자로 세팅
        if (user != null) {
            food.setMemberId(user.getId());
        } else {
            // 로그인 안 했으면 등록 못 하게 로그인 페이지로 튕기기
            return "redirect:/member/login";
        }

        // 3. 이제 정보가 꽉 찬 food 객체를 DB에 저장
        foodService.addFood(food);

        return "redirect:/food/list";
    }

    @GetMapping("/delete")
    public String deleteFood(@RequestParam("foodId") long foodId, HttpSession hs) {
        Member user = (Member) hs.getAttribute("loginUser");

        if (user == null || !"admin".equals(user.getId())) {
            return "redirect:/food/list?error=auth";
        }
        foodService.deleteFood(foodId);
        return "redirect:/food/list";
    }

    // 🎯 수정 폼 열기 (관리자만 가능하게 입구 컷!)
    @GetMapping("/update")
    public String updateFood(Model model, long foodId, HttpSession hs) {
        Member user = (Member) hs.getAttribute("loginUser");

        // 로그인 안 했거나 admin이 아니면 쫓아냄
        if (user == null || !"admin".equals(user.getId())) {
            return "redirect:/food/list?error=auth";
        }

        model.addAttribute("update", foodService.readFood(foodId));
        return "food/update";
    }

    // 수정 처리 (보안을 위해 여기서도 한번 더 체크하는 게 안전해!)
    @PostMapping("/update")
    public String updateFood(Food food, HttpSession hs) {
        Member user = (Member) hs.getAttribute("loginUser");

        if (user == null || !"admin".equals(user.getId())) {
            return "redirect:/food/list?error=auth";
        }

        foodService.updateFood(food);
        return "redirect:/food/list";
    }

}
