package com.kh.member_project.domain;

import lombok.Data;

@Data
public class Board {
    private long bno;
    private String  title;
    private String content;
    private String writer;
    private String regdate;
}
