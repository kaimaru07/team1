package com.web.finalproj.board.mapper;

import java.util.List;

import com.web.finalproj.board.vo.BoardVO;

import net.webjjang.util.PageObject;


public interface BoardMapper {
	//게시판 리스트
	public List<BoardVO> list(PageObject pageObject);
	
	
}
