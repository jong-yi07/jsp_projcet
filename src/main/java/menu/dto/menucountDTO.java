package menu.dto;

public class menucountDTO {
	private String name;
	private String vol;
	private int count;
	
	public menucountDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public menucountDTO(String name, String vol, int count) {
		super();
		this.name = name;
		this.vol = vol;
		this.count = count;
	}
	@Override
	public String toString() {
		return "menucountDTO [name=" + name + ", vol=" + vol + ", count=" + count + "]";
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
	
	
}
