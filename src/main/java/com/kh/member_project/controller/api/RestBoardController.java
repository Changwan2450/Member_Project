package com.kh.member_project.controller.api;

import com.kh.member_project.domain.Board;
import com.kh.member_project.service.BoardService.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@RestController // ★ 중요: 데이터를 JSON으로 쏴주는 전용 컨트롤러
@Slf4j
@RequestMapping("/api/board") // ★ 중요: 리액트 API_BASE랑 맞추기 위해 /api 붙임
@CrossOrigin(origins = "*")  // ★ 중요: 아이패드(리액트) 접속 허용
public class RestBoardController {

    private final BoardService boardService;

    // 1. 게시글 목록 (리액트에서 refreshBoard 실행 시 호출됨)
    @GetMapping("/list")
    public List<Board> boardList(@RequestParam(value = "keyword", required = false) String keyword) {
        log.info("게시판 목록 요청 들어옴, 검색어: {}", keyword);
        return boardService.boardList(keyword);
    }

    // 2. 게시글 상세 (리액트에서 handleBoardRead 실행 시 호출됨)
    @GetMapping("/read/{bno}")
    public Board readBoard(@PathVariable("bno") int bno) {
        log.info("{}번 글 상세 요청", bno);
        return boardService.readBoard(bno);
    }

    // 3. 게시글 등록 (리액트에서 handleBoardWrite 실행 시 호출됨)
    @PostMapping("/register")
    public String register(@RequestBody Board board) { // @RequestBody가 JSON을 자바 객체로 바꿔줌
        log.info("새 글 등록: {}", board);
        boardService.register(board);
        return "success";
    }

    @DeleteMapping("/delete/{bno}")
    public String delete(@PathVariable Long bno, @RequestParam String userId) {
        Board board = boardService.readBoard(bno);
        // 작성자 본인이거나 관리자일 때만 삭제 실행
        if (board.getWriter().equals(userId) || "admin".equals(userId)) {
            boardService.deleteBoard(bno);
            return "success";
        }
        return "fail: 권한 없음";
    }

    @PutMapping("/update")
    public String update(@RequestBody Board board, @RequestParam String userId) {
        log.info("글 수정 요청 bno: {}, 요청자: {}", board.getBno(), userId);

        // 원본 글 읽어와서 작성자 대조 (readBoard도 파라미터 Long으로 되어있어야 함)
        Board origin = boardService.readBoard(board.getBno());

        if (origin != null && (origin.getWriter().equals(userId) || "admin".equals(userId))) {
            boardService.updateBoard(board);
            return "success";
        }
        return "fail: no permission";
    }
}