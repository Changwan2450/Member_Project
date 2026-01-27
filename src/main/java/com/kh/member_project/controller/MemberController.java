package com.kh.member_project.controller;

import com.kh.member_project.domain.Member;
import com.kh.member_project.service.MemberService;
import jakarta.servlet.http.HttpSession;
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
        // 'admin'이라는 아이디는 가입 불가!
        if ("admin".equalsIgnoreCase(member.getId())) {
            log.info("감히 관리자 아이디를 쓰려 하다니!");
            return "redirect:/member/register?error=reserved";
        }
        log.info("회원 가입: {}", member);
        service.register(member);
        return "redirect:/member/list";
    }

    @PostMapping("/login")
    public String login(Member member, HttpSession session) {
        Member loginUser = service.loginMember(member);

        if (loginUser != null) {
            // 2. 정보가 있다면? 그 객체를 'loginUser'라는 이름표를 붙여서 세션(사물함)에 저장!
            session.setAttribute("loginUser", loginUser);
            return "redirect:/food/list";
        } else {
            // 정보가 없으면 로그인 실패 처리
            return "redirect:/member/login?error=y";
        }
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