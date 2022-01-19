package menu.VO;

public class Check {
	private String coffee;
	private String blended;
	private String tea;
	private String Fizzio;
	private String Frappuccino;
	private String drink;
	private String etc;
	public Check() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Check(String coffee, String blended, String tea, String fizzio, String frappuccino, String drink,
			String etc) {
		super();
		this.coffee = coffee;
		this.blended = blended;
		this.tea = tea;
		Fizzio = fizzio;
		Frappuccino = frappuccino;
		this.drink = drink;
		this.etc = etc;
	}
	@Override
	public String toString() {
		return "Check [coffee=" + coffee + ", blended=" + blended + ", tea=" + tea + ", Fizzio=" + Fizzio
				+ ", Frappuccino=" + Frappuccino + ", drink=" + drink + ", etc=" + etc + "]";
	}
	public String getCoffee() {
		return coffee;
	}
	public void setCoffee(String coffee) {
		this.coffee = coffee;
	}
	public String getBlended() {
		return blended;
	}
	public void setBlended(String blended) {
		this.blended = blended;
	}
	public String getTea() {
		return tea;
	}
	public void setTea(String tea) {
		this.tea = tea;
	}
	public String getFizzio() {
		return Fizzio;
	}
	public void setFizzio(String fizzio) {
		Fizzio = fizzio;
	}
	public String getFrappuccino() {
		return Frappuccino;
	}
	public void setFrappuccino(String frappuccino) {
		Frappuccino = frappuccino;
	}
	public String getDrink() {
		return drink;
	}
	public void setDrink(String drink) {
		this.drink = drink;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	
	
}
