package com.kh.member_project.controller;

import com.kh.member_project.domain.Food;
import com.kh.member_project.service.FoodService.FoodService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController // JSON 데이터를 쏘기 위한 전용 컨트롤러
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/api/food") // 리액트랑 겹치지 않게 /api 붙이는 게 국룰
@CrossOrigin(origins = "*")  // 아이패드/외부 접속 허용
public class RestFoodController {

    private final FoodService foodService;

    // 1. 목록 조회 (GET)
    @GetMapping("/list")
    public List<Food> getList() {
        return foodService.getFoodList();
    }

    // 2. 등록 (POST)
    @PostMapping("/register")
    public String register(@RequestBody Food food) {
        // 지금은 세션이 없으니 임시로 admin 세팅
        if (food.getMemberId() == null) food.setMemberId("admin");
        foodService.addFood(food);
        return "success";
    }

    // 3. 삭제 (DELETE)
    @DeleteMapping("/delete/{foodId}")
    public String delete(@PathVariable("foodId") Long foodId) {
        foodService.deleteFood(foodId);
        return "success";
    }

    // RestFoodController.java에 추가
    @PutMapping("/update")
    public String update(@RequestBody Food food) {
        foodService.updateFood(food);
        return "success";
    }
}