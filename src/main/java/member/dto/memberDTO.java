package member.dto;

import java.util.Date;

public class memberDTO {
	private String userid;
	private String passwd;
	private String name;
	private String tel;
	private String email;
	private String join_date;
	private String birth_date;
	public memberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public memberDTO(String userid, String passwd, String name, String tel, String email, String join_date,
			String birth_date) {
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.name = name;
		this.tel = tel;
		this.email = email;
		this.join_date = join_date;
		this.birth_date = birth_date;
	}
	@Override
	public String toString() {
		return "memberDTO [userid=" + userid + ", passwd=" + passwd + ", name=" + name + ", tel=" + tel + ", email="
				+ email + ", join_date=" + join_date + ", birth_date=" + birth_date + "]";
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getJoin_date() {
		return join_date;
	}
	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}
	public String getBirth_date() {
		return birth_date;
	}
	public void setBirth_date(String birth_date) {
		this.birth_date = birth_date;
	}
	
	
}
