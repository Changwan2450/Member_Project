package com.zeus.member_project.controller;

import com.zeus.member_project.domain.Member;
import com.zeus.member_project.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {

    private final MemberService service;

    // 1. 회원가입 페이지 이동
    @GetMapping("/register")
    public String registerForm() {
        return "member/register";
    }

    // 2. 회원가입 처리 (가입 후 목록으로 튕김)
    @PostMapping("/register")
    public String register(Member member) {
        service.register(member);
        return "redirect:/member/list";
    }

    // 3. 목록 조회 (모든 기능의 허브)
    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("list", service.getList());
        return "member/list";
    }

    // 4. 상세 보기 (read) - 주소가 달라야 함!
    @GetMapping("/read")
    public String read(String id, Model model) {
        log.info("회원 상세 조회: {}", id);
        model.addAttribute("member", service.read(id)); // 데이터를 박스에 담아서 보냄
        return "member/read"; // 상세 페이지로 이동
    }

    // 5. 수정 처리 (수정 후 다시 목록으로)
    @PostMapping("/update")
    public String updateMember(Member member) {
        log.info("회원 수정 요청: {}", member);
        service.updateMember(member);
        return "redirect:/member/list";
    }

    // 6. 삭제 처리 (삭제 후 다시 목록으로)
    @PostMapping("/delete")
    public String deleteMember(String id) {
        log.info("회원 삭제 요청: {}", id);
        service.deleteMember(id);
        return "redirect:/member/list";
    }
}