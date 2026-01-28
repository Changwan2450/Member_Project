package com.kh.member_project.service.FoodService;

import com.kh.member_project.domain.Food;
import java.util.List;

public interface FoodService {

    // 음식 등록
    void addFood(Food food);

    // 전체 목록 가져오기
    List<Food> getFoodList();

    Food readFood(Long foodId);

    // 음식 삭제
    void deleteFood(Long foodId);

    // 음식 수정
    void updateFood(Food food);
}