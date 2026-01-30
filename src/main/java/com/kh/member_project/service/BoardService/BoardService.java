package com.kh.member_project.service.BoardService;

import com.kh.member_project.domain.Board;

import java.util.List;

public interface BoardService {
    void register(Board board);
    List<Board> boardList(String keyword);
    Board readBoard(long bno);
    void deleteBoard(long bno);
    void updateBoard(Board board);
}
