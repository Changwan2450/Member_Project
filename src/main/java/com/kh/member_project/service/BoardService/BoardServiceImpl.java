package com.kh.member_project.service.BoardService;

import com.kh.member_project.domain.Board;
import com.kh.member_project.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {
    private final BoardMapper boardMapper;

    @Override
    public void register(Board board) {
      boardMapper.insertBoard(board);
    }

    @Override
    public List<Board> boardList(String keyword) {

        return boardMapper.boardList(keyword);
    }

    @Override
    public Board readBoard(long bno) {

        return boardMapper.readBoard(bno);
    }

    @Override
    public void deleteBoard(long bno) {
        boardMapper.deleteBoard(bno);
    }

    @Override
    public void updateBoard(Board board) {
        boardMapper.updateBoard(board);
    }
}
