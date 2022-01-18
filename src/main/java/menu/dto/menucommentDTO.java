package menu.dto;

import java.util.Date;

public class menucommentDTO {
	private int comment_num;
	private int num;
	private String name;
	private String content;
	private Date reg_date;
	private String filename; //파일이름
	private int filesize;  //파일사이즈
	private String ext; //첨부파일의 확장자, 테이블에는 없음
	public menucommentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public menucommentDTO(int comment_num, int num, String name, String content, Date reg_date, String filename,
			int filesize, String ext) {
		super();
		this.comment_num = comment_num;
		this.num = num;
		this.name = name;
		this.content = content;
		this.reg_date = reg_date;
		this.filename = filename;
		this.filesize = filesize;
		this.ext = ext;
	}
	@Override
	public String toString() {
		return "menucommentDTO [comment_num=" + comment_num + ", num=" + num + ", name=" + name + ", content=" + content
				+ ", reg_date=" + reg_date + ", filename=" + filename + ", filesize=" + filesize + ", ext=" + ext + "]";
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
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	public String getExt() {
		return ext;
	}
	public void setExt(String ext) {
		this.ext = ext;
	}
	
	
	
	
}
