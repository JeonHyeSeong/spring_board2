package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.security.AuthVO;
import com.myweb.www.security.MemberVO;

public interface MemberDAO {

	int insertMember(MemberVO mvo);

	int insertAuthInit(String email);

	MemberVO selectEmail(String username);

	List<AuthVO> selectAuths(String username);

	int updateLastLogin(String authEmail);

	List<MemberVO> getList();

	MemberVO getDetail(String email);

	int updateMember(MemberVO mvo);

	int upMember(MemberVO mvo);

	int remove(String email);

	void authRemove(String email);

}
