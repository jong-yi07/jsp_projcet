package menu.dto;

public class menuviewDTO {
	private int num;
	private String name;
	private String menu_detail;
	private String classification;
	private String count;
	private String vol;
	private int caffeine;
	private int fat;
	private int kcal;
	private int natrium;
	private int protein;
	private int sugar;
	public menuviewDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public menuviewDTO(int num, String name, String menu_detail, String classification, String count, String vol,
			int caffeine, int fat, int kcal, int natrium, int protein, int sugar) {
		super();
		this.num = num;
		this.name = name;
		this.menu_detail = menu_detail;
		this.classification = classification;
		this.count = count;
		this.vol = vol;
		this.caffeine = caffeine;
		this.fat = fat;
		this.kcal = kcal;
		this.natrium = natrium;
		this.protein = protein;
		this.sugar = sugar;
	}
	@Override
	public String toString() {
		return "menuviewDTO [num=" + num + ", name=" + name + ", menu_detail=" + menu_detail + ", classification="
				+ classification + ", count=" + count + ", vol=" + vol + ", caffeine=" + caffeine + ", fat=" + fat
				+ ", kcal=" + kcal + ", natrium=" + natrium + ", protein=" + protein + ", sugar=" + sugar + "]";
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
		return classification;
	}
	public void setClassification(String classification) {
		this.classification = classification;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getVol() {
		return vol;
	}
	public void setVol(String vol) {
		this.vol = vol;
	}
	public int getCaffeine() {
		return caffeine;
	}
	public void setCaffeine(int caffeine) {
		this.caffeine = caffeine;
	}
	public int getFat() {
		return fat;
	}
	public void setFat(int fat) {
		this.fat = fat;
	}
	public int getKcal() {
		return kcal;
	}
	public void setKcal(int kcal) {
		this.kcal = kcal;
	}
	public int getNatrium() {
		return natrium;
	}
	public void setNatrium(int natrium) {
		this.natrium = natrium;
	}
	public int getProtein() {
		return protein;
	}
	public void setProtein(int protein) {
		this.protein = protein;
	}
	public int getSugar() {
		return sugar;
	}
	public void setSugar(int sugar) {
		this.sugar = sugar;
	}
	
	
}
