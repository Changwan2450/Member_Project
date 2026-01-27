package com.kh.member_project.service;

import com.kh.member_project.domain.Food;
import com.kh.member_project.mapper.FoodMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class FoodServiceImpl implements FoodService {

    private final FoodMapper foodMapper;


    @Override
    public void addFood(Food food) {
        foodMapper.insertFood(food);
    }

    @Override
    public List<Food> getFoodList() {
        return foodMapper.getFoodList();
    }

    @Override
    public Food readFood(Long foodId) {
        return foodMapper.readFood(foodId);
    }

    @Override
    public void deleteFood(Long foodId) {
        foodMapper.deleteFood(foodId);
    }

    @Override
    public void updateFood(Food food) {
        foodMapper.updateFood(food);
    }
}
