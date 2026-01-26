package com.zeus.member_project.service;

import com.zeus.member_project.domain.Member;
import com.zeus.member_project.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor //Autowired 같은거 이게 보안상 더좋음 final 붙이기
public class MemberServiceImpl implements MemberService {

    private final MemberMapper mapper;

    @Override
    public void register(Member member) {
        mapper.insertMember(member);
    }

    @Override
    public Member login(Member member) {
        return mapper.loginMember(member);
    }

    @Override
    public List<Member> getList() {
        return mapper.getMemberList();
    }

    @Override
    public void deleteMember(String id) {
        mapper.deleteMember(id);
    }

    @Override
    public Member read(String id) {
        return mapper.read(id);
    }

    @Override
    public void updateMember(Member member) {
        mapper.updateMember(member);
    }
}
