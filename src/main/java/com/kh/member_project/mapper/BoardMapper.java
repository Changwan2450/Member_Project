package com.kh.member_project.mapper;

import com.kh.member_project.domain.Board;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    void insertBoard(Board board);
    List<Board> boardList();
    Board readBoard(int bno);
    void deleteBoard(int bno);
    void updateBoard(Board board);
}
