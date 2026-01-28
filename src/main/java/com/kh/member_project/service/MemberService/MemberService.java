package com.kh.member_project.service.MemberService;

import com.kh.member_project.domain.Member;
import java.util.List;

public interface MemberService {
     void register(Member member);
     Member loginMember(Member member);
     List<Member> getList();
     void deleteMember(String id);
     Member read(String id);
     void updateMember(Member member);
}
