package com.kh.member_project.mapper;

import com.kh.member_project.domain.Member;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface MemberMapper {
    void insertMember(Member member);
    Member loginMember(Member member);
    List<Member> getMemberList();
    void deleteMember(String id);
    Member read(String id);
    void updateMember(Member member);
}