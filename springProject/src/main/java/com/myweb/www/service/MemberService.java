package com.myweb.www.service;

import java.util.List;

import com.myweb.www.security.MemberVO;

public interface MemberService {

	int register(MemberVO mvo);

	boolean updateLastLogin(String authEmail);

	List<MemberVO> getList();

	MemberVO getDetail(String email);

	int memberUpdate(MemberVO mvo);

	int memberUp(MemberVO mvo);

	int remove(String email);

}
