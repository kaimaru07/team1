package reply;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReplyVO {
	private int reply_id;
	private int post_id;
	private String reply_author;
	private String reply_context;
	private Date reply_date;
	private String real_author;

	public String getReal_author() {
		return real_author;
	}

	public void setReal_author(String real_author) {
		this.real_author = real_author;
	}

	public ReplyVO() {
	}

	public ReplyVO(int post_id, String reply_author, String reply_context, String real_author) {
		this.post_id = post_id;
		this.reply_author = reply_author;
		this.reply_context = reply_context;
		this.real_author = real_author;
	}
	
	public void setRecord(ResultSet record) throws SQLException {
		this.reply_id = record.getInt("reply_id");
		this.post_id = record.getInt("post_id");
		this.reply_author = record.getString("reply_author");
		this.reply_context = record.getString("reply_context");
		this.reply_date = record.getDate("reply_date");
		this.real_author = record.getString("real_author");
	}
	
	public int getReply_id() {
		return reply_id;
	}

	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}

	public int getPost_id() {
		return post_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	public String getReply_author() {
		return reply_author;
	}

	public void setReply_author(String reply_author) {
		this.reply_author = reply_author;
	}

	public String getReply_context() {
		return reply_context;
	}

	public void setReply_context(String reply_context) {
		this.reply_context = reply_context;
	}

	public Date getReply_date() {
		return reply_date;
	}

	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}

}
