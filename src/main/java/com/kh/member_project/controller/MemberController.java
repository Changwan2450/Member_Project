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
@RequiredArgsConstructor
public class MemberController {

    private final MemberService service;

    @GetMapping("/register")
    public String registerForm() {
        return "member/register";
    }

    @PostMapping("/register")
    public String register(Member member, HttpSession session) { // session 추가!
        // 'admin' 아이디 예약어 방지
        if ("admin".equalsIgnoreCase(member.getId())) {
            log.info("관리자 아이디 사칭 차단: {}", member.getId());
            return "redirect:/member/register?error=reserved";
        }

        log.info("회원 가입 진행: {}", member);
        service.register(member);

        // 가입 성공 즉시 세션에 정보 담아서 로그인 상태로 만듦
        session.setAttribute("loginUser", member);

        // 회원 리스트가 아닌 음식 목록으로 바로 이동
        return "redirect:/food/list";
    }

    @GetMapping("/login")
    public String loginForm() {
        return "member/login";
    }

    @PostMapping("/login")
    public String login(Member member, HttpSession session) {
        Member loginUser = service.loginMember(member);

        if (loginUser != null) {
            log.info("로그인 성공: {}", loginUser.getId());
            session.setAttribute("loginUser", loginUser);
            return "redirect:/food/list";
        } else {
            log.info("로그인 실패: 아이디 또는 비번 불일치");
            return "redirect:/member/login?error=y";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        log.info("로그아웃 시도");
        session.invalidate(); // 세션(사물함)을 아예 폭파시켜서 로그인 정보를 지움
        return "redirect:/food/list"; // 메인 페이지(음식 목록)로 쫓아냄
    }

    @GetMapping("/list")
    public String list(Model model, HttpSession session) { // session 추가!
        // 세션에서 로그인한 유저 꺼내오기
        Member loginUser = (Member) session.getAttribute("loginUser");

        // 로그인 안 했거나 admin이 아니면 입구 컷!
        if (loginUser == null || !"admin".equals(loginUser.getId())) {
            log.warn("허가되지 않은 접근: 일반 유저가 회원 목록 시도");
            return "redirect:/food/list";
        }

        // 오직 admin일 때만 도달하는 코드
        log.info("관리자 권한 확인 - 회원 목록 조회");
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
        log.info("회원 정보 수정: {}", member);
        service.updateMember(member);
        // 수정 후에는 관리자라면 목록으로, 일반 유저라면 자기 정보 페이지로 가야겠지만 일단 목록으로 세팅
        return "redirect:/member/list";
    }

    @PostMapping("/delete")
    public String delete(String id) {
        log.info("회원 삭제 요청 ID: {}", id);
        service.deleteMember(id);
        return "redirect:/member/list";
    }
}