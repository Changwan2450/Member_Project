package com.kh.member_project.controller;

import com.kh.member_project.domain.Board;
import com.kh.member_project.service.BoardService.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequiredArgsConstructor
@Controller
@Slf4j
@RequestMapping("/board")
public class BoardController {

    private final BoardService boardService;

    @GetMapping("/register")
    public void registerf(){};

    @PostMapping("/register")
    public String register(Board board){
        boardService.register(board);
        return "redirect:/board/list";
    }

    @GetMapping("/list")
    public void boardList(Model model, @RequestParam(value="keyword",required = false) String keyword){
        model.addAttribute("keyword", keyword);
        model.addAttribute("bList", boardService.boardList(keyword));
    }

    @GetMapping("/read")
    public void readBoard(@RequestParam("bno") int bno, Model model){
    model.addAttribute("bn",boardService.readBoard(bno));
    }

    @GetMapping("/delete")
    public String deleteBoard(@RequestParam("bno") int bno){
        boardService.deleteBoard(bno);
        return "redirect:/board/list";
    }

    @GetMapping("/modify")
    public void modifyBoard(@RequestParam("bno")int bno, Model model){
        model.addAttribute("rbn", boardService.readBoard(bno));
    }

    @PostMapping("/modify")
    public String modifyB(Board board){
        boardService.updateBoard(board);
        return "redirect:/board/list";
    }
}
