package com.kh.member_project.service.BoardService;

import com.kh.member_project.domain.Board;

import java.util.List;

public interface BoardService {
    void register(Board board);
    List<Board> boardList(String keyword);
    Board readBoard(int bno);
    void deleteBoard(int bno);
    void updateBoard(Board board);
}
