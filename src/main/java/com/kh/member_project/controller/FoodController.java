package com.kh.member_project.controller;

import com.kh.member_project.domain.Food;
import com.kh.member_project.service.FoodService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
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
    public String register(Food food) {
        log.info("음식 등록 처리 중: {}", food);
        foodService.addFood(food);
        return "redirect:/food/list";
    }

    @GetMapping("/delete")
    public String deleteFood(long foodId){
        log.info("회 원 삭 제 중,,");
        foodService.deleteFood(foodId);
        return "redirect:/food/list";
    }

    @GetMapping("/update")
    public String updateFood(Model model, long foodId){
        log.info("회 원 수 정 페이지");
        model.addAttribute("update",foodService.readFood(foodId));
        return "food/update";
    }

    @PostMapping("/update")
    public String updateFood(Food food){
        log.info("회 원 수 정 중 : {}", food);
        foodService.updateFood(food);
        return "redirect:/food/list";
    }

}
