package wh.user.kakaopay.model;

public class KakaoPayRequestDto {
	String item_name;
	String quantity;
	String total_amount;
	String tax_free_amount;
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(String total_amount) {
		this.total_amount = total_amount;
	}
	public String getTax_free_amount() {
		return tax_free_amount;
	}
	public void setTax_free_amount(String tax_free_amount) {
		this.tax_free_amount = tax_free_amount;
	}
	@Override
	public String toString() {
		return "KakaoPayRequestVO [item_name=" + item_name + ", quantity=" + quantity + ", total_amount=" + total_amount
				+ ", tax_free_amount=" + tax_free_amount + "]";
	}
	
	
	
}
