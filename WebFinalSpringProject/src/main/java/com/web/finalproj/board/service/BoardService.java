package com.web.finalproj.board.service;

import java.util.List;

import com.web.finalproj.board.dto.BoardDTO;
import com.web.finalproj.board.dto.BoardSearchDTO;
import com.web.finalproj.fileupload.vo.FileUploadVO;

public interface BoardService {
	public boolean add(BoardDTO dto) throws Exception;
	public boolean update(BoardDTO dto) throws Exception;
	public boolean remove(int bid) throws Exception;
	public List<BoardDTO> findAll() throws Exception;
	public BoardDTO findId(int id) throws Exception;
	public List<BoardDTO> findType(int btype) throws Exception;
	public List<BoardDTO> findTitle(String title) throws Exception;
	public List<BoardDTO> findAuthor(int aid) throws Exception;
	public List<BoardDTO> findList(BoardSearchDTO search) throws Exception;
	public boolean fileAdd(FileUploadVO vo) throws Exception;
	public FileUploadVO getFile(int bid) throws Exception;
	public void viewCount(int bid) throws Exception;
}
