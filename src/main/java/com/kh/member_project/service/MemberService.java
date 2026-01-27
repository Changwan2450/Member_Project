package com.kh.member_project.service;

import com.kh.member_project.domain.Member;
import java.util.List;

public interface MemberService {
     void register(Member member);
     Member login(Member member);
     List<Member> getList();
     void deleteMember(String id);
     Member read(String id);
     void updateMember(Member member);
}
