package com.kh.member_project.service.BoardService;

import com.kh.member_project.domain.Board;
import com.kh.member_project.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{
    private final BoardMapper boardMapper;


    @Override
    public void register(Board board) {

    }

    @Override
    public List<Board> boardList() {
        return List.of();
    }

    @Override
    public Board readBoard(int bno) {
        return null;
    }

    @Override
    public void deleteBoard(int bno) {

    }

    @Override
    public void updateBoard(Board board) {

    }
}
