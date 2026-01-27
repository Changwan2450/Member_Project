package com.kh.member_project.domain;

import lombok.Data;

import java.util.Date;

@Data
public class Food {
    private Long foodId;      // 음식 번호 (시퀀스)
    private String foodName;  // 음식 이름
    private int price;        // 가격
    private String category;  // 종류 (한식, 중식, 일식 등)
    private String memberId; // ★중요: 누가 등록했는지 (Member의 id랑 연결!)
    private Date regdate;    //  등록 날짜
}