package wh.admin.manage.model;

import java.sql.Timestamp;

public class PayListDto {
	private String member_id;
	private int purchase_amount;
	private int fork;
	private Timestamp fork_date;
	private int class_price;
	private Timestamp class_date;
	private String chef;
	private String c_name;
	private String nickname;

	public String getChef() {
		return chef;
	}

	@Override
	public String toString() {
		return "PayListDto [member_id=" + member_id + ", purchase_amount=" + purchase_amount + ", fork=" + fork
				+ ", fork_date=" + fork_date + ", class_price=" + class_price + ", class_date=" + class_date + ", chef="
				+ chef + ", c_name=" + c_name + ", nickname=" + nickname + "]";
	}

	public void setChef(String chef) {
		this.chef = chef;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getPurchase_amount() {
		return purchase_amount;
	}

	public void setPurchase_amount(int purchase_amount) {
		this.purchase_amount = purchase_amount;
	}

	public int getFork() {
		return fork;
	}

	public void setFork(int fork) {
		this.fork = fork;
	}

	public Timestamp getFork_date() {
		return fork_date;
	}

	public void setFork_date(Timestamp fork_date) {
		this.fork_date = fork_date;
	}

	public int getClass_price() {
		return class_price;
	}

	public void setClass_price(int class_price) {
		this.class_price = class_price;
	}

	public Timestamp getClass_date() {
		return class_date;
	}

	public void setClass_date(Timestamp class_date) {
		this.class_date = class_date;
	}

}
