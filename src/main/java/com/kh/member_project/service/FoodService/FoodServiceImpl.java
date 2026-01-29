package com.kh.member_project.service.FoodService;

import com.kh.member_project.domain.Food;
import com.kh.member_project.mapper.FoodMapper;
import com.kh.member_project.mapper.OrderMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@RequiredArgsConstructor
@Service
public class FoodServiceImpl implements FoodService {
    private final FoodMapper foodMapper;
    private final OrderMapper orderMapper;


    @Override
    public void addFood(Food food) {
        foodMapper.insertFood(food);
    }
    @Override
    public List<Food> getFoodList() {
        return foodMapper.getFoodList();
    }
    @Override
    public Food readFood(Long foodId) {return foodMapper.readFood(foodId);}

    @Transactional
    @Override
    public void deleteFood(Long foodId) {
        orderMapper.deleteOrdersByFno(foodId);
        foodMapper.deleteFood(foodId);
    }
    @Override
    public void updateFood(Food food) {foodMapper.updateFood(food);}
}
