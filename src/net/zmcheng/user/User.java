package net.zmcheng.user;

public class User {
	private String name;
	private int id;
	private String psw;
	private String fname;
	private String tel;
	public User(){
		super();
	}
	public User(String name){
		this.name = name;
	}
	public User(int id,String name,String psw,String fname,String tel){
		this.id = id;
		this.name = name;
		this.psw  = psw;
		this.fname = fname;
		this.tel = tel; 
	}
	public String getName() {
		return name;
	}
	public int getId() {
		return id;
	}
	public String getPsw() {
		return psw;
	}
	public String getFname() {
		return fname;
	}
	public String getTel() {
		return tel;
	}

	public void setName(String name) {
		this.name = name;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setPsw(String psw) {
		this.psw = psw;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public void setTel(String tel) {
		this.tel= tel;
	}
	
}

