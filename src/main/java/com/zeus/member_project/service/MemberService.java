package com.zeus.member_project.service;

import com.zeus.member_project.domain.Member;

import java.util.List;

public interface MemberService {
    public void register(Member member);

    public Member login(Member member);

    public List<Member> getList();

    public void deleteMember(String id);

    public Member read(String id);

    public void updateMember(Member member);
}
