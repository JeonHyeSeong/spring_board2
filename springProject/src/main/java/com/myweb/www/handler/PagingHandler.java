package com.myweb.www.handler;

import java.util.List;

import com.myweb.www.domain.CommentVO;
import com.myweb.www.domain.PagingVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PagingHandler {
	
	private int startPage; // 화면에 보여지는 시작 페이지네이션 번호
	private int endPage; // 화면에 보여지는 끝 페이지네이션 번호
	private int realEndPage;
	private boolean prev, next; // 이전, 다음의 존재여부
	private int totalCount; // 총 게시글 수
	private PagingVO pgvo;
	
	private List<CommentVO> cmtList;
	
	// 현재 페이지 값 가져오는 용도 / totalCount DB에서 조회 매개변수로 입력받기
	public PagingHandler(PagingVO pgvo, int totalCount) {
		// pgvo.qty : 한 페이지에 보이는 게시글의 수 10개
		this.pgvo = pgvo;
		this.totalCount = totalCount;
		
		// 1~10 / 11~20 / 21~30
		// 1페이지부터 10페이지까지 어떤 페이지가 선택되도 endPage는 10
		// 1 2 3 4 .. 10 / 10 나머지를 올려(ceil) 1로 만듬 *10 
		// 화면에 표시되어야 하는 페이지 개수
		this.endPage = (int)Math.ceil(pgvo.getPageNo() / (double)pgvo.getQty()) * pgvo.getQty();
		
		this.startPage = endPage - 9;
		
		// 전체 글수에서 / 한 페이지에 표시되는 게시글 수 => 올림
		this.realEndPage = (int)Math.ceil(totalCount / (double)pgvo.getQty());
		
		if(realEndPage < endPage) {
			this.endPage = realEndPage;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEndPage;
	}
	
	public PagingHandler(PagingVO pgvo, int totalCount, List<CommentVO> cmtList) {
		this(pgvo, totalCount);
		this.cmtList = cmtList;
	}
	
}
