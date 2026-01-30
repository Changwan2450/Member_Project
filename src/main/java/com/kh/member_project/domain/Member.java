package com.kh.member_project.domain;

import lombok.Data;

@Data
public class Member {
    private String id;
    private String pw;
    private String name;
    private Integer age;
    private String auth;      // 권한 나중에
    private String regdate;   // 가입일 (Oracle DATE 타입을 String으로 받아도 됨)
}
