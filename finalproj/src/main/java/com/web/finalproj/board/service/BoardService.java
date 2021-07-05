package com.web.finalproj.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.web.finalproj.board.mapper.BoardMapper;
import com.web.finalproj.board.vo.BoardVO;

import net.webjjang.util.PageObject;



@Service
public class BoardService {
	
	@Inject
	private BoardMapper mapper;
	
	public List<BoardVO> list(PageObject pageObject) {
		System.out.println("BoardService.list().pageObject:"+pageObject);
		return mapper.list(pageObject);
		
		}
	}
	
