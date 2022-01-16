package menu.dto;

//사용자 주문내역
public class menuOrderDTO {
	private int order_num; 
	private String name; //메뉴 이름
	private String vol; //메뉴 사이즈
	private int count; //메뉴 가격
	private String temp; //메뉴 온도 
	private String cup; //컵
	private String userid; //유저아이디 
	public menuOrderDTO(int order_num, String name, String vol, int count, String temp, String cup, String userid) {
		super();
		this.order_num = order_num;
		this.name = name;
		this.vol = vol;
		this.count = count;
		this.temp = temp;
		this.cup = cup;
		this.userid = userid;
	}
	public menuOrderDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "menuOrderDTO [order_num=" + order_num + ", name=" + name + ", vol=" + vol + ", count=" + count
				+ ", temp=" + temp + ", cup=" + cup + ", userid=" + userid + "]";
	}
	public int getOrder_num() {
		return order_num;
	}
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getVol() {
		return vol;
	}
	public void setVol(String vol) {
		this.vol = vol;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getTemp() {
		return temp;
	}
	public void setTemp(String temp) {
		this.temp = temp;
	}
	public String getCup() {
		return cup;
	}
	public void setCup(String cup) {
		this.cup = cup;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	
}
