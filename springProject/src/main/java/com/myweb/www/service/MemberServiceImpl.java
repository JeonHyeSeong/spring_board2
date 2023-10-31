package com.myweb.www.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.www.repository.MemberDAO;
import com.myweb.www.security.MemberVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{
	private final MemberDAO mdao;

	@Transactional
	@Override
	public int register(MemberVO mvo) {
		log.info("Member Register check");
		int isOk = mdao.insertMember(mvo);
		return mdao.insertAuthInit(mvo.getEmail());
	}

	@Override
	public boolean updateLastLogin(String authEmail) {
		
		return mdao.updateLastLogin(authEmail) > 0? true : false;
	}

	@Override
	public List<MemberVO> getList() {
		// TODO Auto-generated method stub
		return mdao.getList();
	}

	@Override
	public MemberVO getDetail(String email) {
		// TODO Auto-generated method stub
		return mdao.getDetail(email);
	}

	@Override
	public int memberUpdate(MemberVO mvo) {
		// TODO Auto-generated method stub
		return mdao.updateMember(mvo);
	}

	@Override
	public int memberUp(MemberVO mvo) {
		// TODO Auto-generated method stub
		return mdao.upMember(mvo);
	}

	@Transactional
	@Override
	public int remove(String email) {
		mdao.authRemove(email);
		return mdao.remove(email);
	}
}
