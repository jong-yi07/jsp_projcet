package menu.dto;

public class menuInformationDTO {
	private String name; //메뉴이름 
	private int kcal; //칼로리
	private int natrium; //나트륨 
	private int fat; //포화지방
	private int sugar; //당류
	private int protein; //단백질
	private int Caffeine; //카페인
	public menuInformationDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public menuInformationDTO(String name, int kcal, int natrium, int fat, int sugar, int protein, int caffeine) {
		super();
		this.name = name;
		this.kcal = kcal;
		this.natrium = natrium;
		this.fat = fat;
		this.sugar = sugar;
		this.protein = protein;
		Caffeine = caffeine;
	}
	@Override
	public String toString() {
		return "menuInformationDTO [name=" + name + ", kcal=" + kcal + ", natrium=" + natrium + ", fat=" + fat
				+ ", sugar=" + sugar + ", protein=" + protein + ", Caffeine=" + Caffeine + "]";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public int getFat() {
		return fat;
	}
	public void setFat(int fat) {
		this.fat = fat;
	}
	public int getSugar() {
		return sugar;
	}
	public void setSugar(int sugar) {
		this.sugar = sugar;
	}
	public int getProtein() {
		return protein;
	}
	public void setProtein(int protein) {
		this.protein = protein;
	}
	public int getCaffeine() {
		return Caffeine;
	}
	public void setCaffeine(int caffeine) {
		Caffeine = caffeine;
	}
	
	
}
