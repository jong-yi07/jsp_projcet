package menu.dto;

public class menuDTO {
	private int num; //메뉴번호
	private String name; //메뉴이름
	private String menu_detail; //메뉴 설명
	private String Classification; //메뉴 분류
	private menucountDTO menucountdto; //join을 위한 객체
		
@Override
	public String toString() {
		return "menuDTO [num=" + num + ", name=" + name + ", menu_detail=" + menu_detail + ", Classification="
				+ Classification + ", menucountdto=" + menucountdto + "]";
	}
	public menucountDTO getMenucountdto() {
		return menucountdto;
	}
	public void setMenucountdto(menucountDTO menucountdto) {
		this.menucountdto = menucountdto;
	}
	public menuDTO() {
		this.menucountdto=new menucountDTO();
		// TODO Auto-generated constructor stub
	}
	public menuDTO(int num, String name, String menu_detail, String classification) {
		super();
		this.num = num;
		this.name = name;
		this.menu_detail = menu_detail;
		Classification = classification;
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
	public String getMenu_detail() {
		return menu_detail;
	}
	public void setMenu_detail(String menu_detail) {
		this.menu_detail = menu_detail;
	}
	public String getClassification() {
		return Classification;
	}
	public void setClassification(String classification) {
		Classification = classification;
	}

}
