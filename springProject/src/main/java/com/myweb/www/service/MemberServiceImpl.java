package com.myweb.www.service;

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
}
