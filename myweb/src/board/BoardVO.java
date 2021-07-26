package board;

import java.sql.ResultSet;
import java.sql.SQLException;

public class BoardVO {
	private int post_id;
	private String btype;
	private String author;
	private String title;
	private String post_context;
	private String create_date;
	private String update_date;
	private int reply_cnt;
	private int view_cnt;
	private int like_cnt;
	private int dislike_cnt;
	
	public BoardVO() {}
	
	public BoardVO(String btype, String title, String author, String post_context) {
		this.btype = btype;
		this.title = title;
		this.author = author;
		this.post_context = post_context;
	}

	public void setRecord(ResultSet record) throws SQLException {
		this.post_id = record.getInt("post_id");
		this.btype = record.getString("btype");
		this.author = record.getString("author");
		this.title = record.getString("title");
		this.post_context = record.getString("post_context");
		this.create_date = record.getString("create_date");
		this.update_date = record.getString("update_date");
		this.reply_cnt = record.getInt("reply_cnt");
		this.view_cnt = record.getInt("view_cnt");
		this.like_cnt = record.getInt("like_cnt");
		this.dislike_cnt = record.getInt("dislike_cnt");
	}
	
	public int getReply_cnt() {
		return reply_cnt;
	}

	public void setReply_cnt(int reply_cnt) {
		this.reply_cnt = reply_cnt;
	}

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	public String getBtype() {
		return btype;
	}

	public void setBtype(String btype) {
		this.btype = btype;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPost_context() {
		return post_context;
	}

	public void setPost_context(String post_context) {
		this.post_context = post_context;
	}

	public String getCreate_date() {
		return create_date;
	}

	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}

	public String getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}

	public int getView_cnt() {
		return view_cnt;
	}

	public void setView_cnt(int view_cnt) {
		this.view_cnt = view_cnt;
	}

	public int getLike_cnt() {
		return like_cnt;
	}

	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}

	public int getDislike_cnt() {
		return dislike_cnt;
	}

	public void setDislike_cnt(int dislike_cnt) {
		this.dislike_cnt = dislike_cnt;
	}
	
}
