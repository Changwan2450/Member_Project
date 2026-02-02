package com.kh.member_project.controller.api;

import com.kh.member_project.domain.Member;
import com.kh.member_project.service.MemberService.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/api/member")
@CrossOrigin(origins = "*") // 아이패드 원격 접속 허용
public class RestMemberController {

    private final MemberService service;

    // 1. 멤버 리스트 조회 (중복 제거됨)
    @GetMapping("/list")
    public List<Member> getList() {
        return service.getList();
    }

    // 2. 로그인
    @PostMapping("/login")
    public Map<String, Object> login(@RequestBody Member member, HttpSession session) {
        Member loginUser = service.loginMember(member);
        Map<String, Object> result = new HashMap<>();

        if (loginUser != null) {
            result.put("status", "success");
            result.put("user", loginUser);
            return result;
        } else {
            result.put("status", "fail");
            return result;
        }
    }

    // 3. 회원가입
    @PostMapping("/register")
    public String register(@RequestBody Member member) {
        if ("admin".equalsIgnoreCase(member.getId())) return "reserved";
        service.register(member);
        return "success";
    }

    // 4. 멤버 정보 수정 (PUT)
    @PutMapping("/update")
    public String update(@RequestBody Member member) {

        // ID가 없으면 SQL WHERE절이 안 먹혀서 위험함
        if (member.getId() == null || member.getId().isEmpty()) {
            log.error("수정 실패: ID가 넘어오지 않음!");
            return "fail";
        }

        service.updateMember(member);
        return "success";
    }

    // 5. 멤버 강퇴/삭제 (DELETE)
    @DeleteMapping("/delete/{id}")
    public String delete(@PathVariable("id") String id) {
        service.deleteMember(id);
        return "success";
    }
}