package com.zeus.member_project.mapper;

import com.zeus.member_project.domain.Member;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper // "이 인터페이스가 XML이랑 연결될 매퍼다!"라고 알려주는 필수 어노테이션
public interface MemberMapper {

    // 회원 저장 (매개변수로 Member 박스를 받아야 함)
    void insertMember(Member member);

    // 로그인 (ID, PW 담긴 Member를 주고 결과 Member를 받음)
    Member loginMember(Member member);

    // 전체 목록 조회
    List<Member> getMemberList();

    //회원 삭제
    void deleteMember(String id);

    //회원 검색
    Member read(String id);

    //회원수정
    void updateMember(Member member);
}