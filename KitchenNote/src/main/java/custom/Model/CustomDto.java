package custom.Model;

public class CustomDto {

	int num;
	String name;
	String user;
	String onc;
	int count;
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
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getOnc() {
		return onc;
	}
	public void setOnc(String onc) {
		this.onc = onc;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "CustomDto [num=" + num + ", name=" + name + ", user=" + user + ", onc=" + onc + ", count=" + count
				+ "]";
	}
	
	
}
