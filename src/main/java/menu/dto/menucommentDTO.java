package menu.dto;

import java.util.Date;

public class menucommentDTO {
	private int comment_num;
	private int num;
	private String name;
	private String content;
	private Date reg_date;
	public menucommentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public menucommentDTO(int comment_num, int num, String name, String content, Date reg_date) {
		super();
		this.comment_num = comment_num;
		this.num = num;
		this.name = name;
		this.content = content;
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "menucommentDTO [comment_num=" + comment_num + ", num=" + num + ", name=" + name + ", content=" + content
				+ ", reg_date=" + reg_date + "]";
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
