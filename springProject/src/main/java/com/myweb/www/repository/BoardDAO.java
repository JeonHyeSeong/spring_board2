package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.BoardVO;

public interface BoardDAO {

	int insert(BoardVO bvo);

	List<BoardVO> getList();

	BoardVO getDetail(long bno);
	BoardVO cntdetail(long bno);
	void readcount(long bno);

	int update(BoardVO bvo);

	int remove(long bno);



}
