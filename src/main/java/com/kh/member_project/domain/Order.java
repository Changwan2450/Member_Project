package com.kh.member_project.domain;

import lombok.Data;

@Data
public class Order {
    private int ono;
    private int fno;
    private String id;
    private int amount;
    private String regdate;
    private String foodName;
}
