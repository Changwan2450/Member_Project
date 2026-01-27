package com.kh.member_project.mapper;

import com.kh.member_project.domain.Food;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FoodMapper {
    void insertFood(Food food);
    List<Food> getFoodList();
    void deleteFood(Long foodId);
    void updateFood(Food food);
    Food readFood(Long foodId);
}
