package yh.admin.controller;

//홈페이지 통계 판매 레시피 수
public class AdminSaleDto {

	int recipeSaleCount;
	int monthSale;
	int yearSale;
	public int getRecipeSaleCount() {
		return recipeSaleCount;
	}
	public void setRecipeSaleCount(int recipeSaleCount) {
		this.recipeSaleCount = recipeSaleCount;
	}
	public int getMonthSale() {
		return monthSale;
	}
	public void setMonthSale(int monthSale) {
		this.monthSale = monthSale;
	}
	public int getYearSale() {
		return yearSale;
	}
	public void setYearSale(int yearSale) {
		this.yearSale = yearSale;
	}
	@Override
	public String toString() {
		return "AdminSaleDto [recipeSaleCount=" + recipeSaleCount + ", monthSale=" + monthSale + ", yearSale="
				+ yearSale + "]";
	}

	

}
