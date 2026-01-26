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
@RequiredArgsConstructor //Autowired 같은거 이게 보안상 더좋음 final 붙이기
public class MemberController {

    private final MemberService service;

    @GetMapping("/register")
    public String registerForm() {
        return "member/register";
    }

    @PostMapping("/register")
    public String register(Member member) {
        log.info("회원 가입: {}", member);
        service.register(member);
        return "redirect:/member/list";
    }

    @GetMapping("/list")
    public String list(Model model) {
        log.info("목록 조회 진입");
        model.addAttribute("list", service.getList());
        return "member/list";
    }

    @GetMapping("/read")
    public String read(String id, Model model) {
        log.info("상세 조회 ID: {}", id);
        model.addAttribute("member", service.read(id));
        return "member/read";
    }

    @PostMapping("/update")
    public String update(Member member) {
        log.info("회원 수정: {}", member);
        service.updateMember(member);
        return "redirect:/member/list";
    }

    @PostMapping("/delete")
    public String delete(String id) {
        log.info("회원 삭제: {}", id);
        service.deleteMember(id);
        return "redirect:/member/list";
    }
}