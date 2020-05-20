package info.dto;

public class RestconDto {
	private Integer conno;
	private int restno;
	private String conname;
	private String conde;
	
	
	public RestconDto(String conname, String conde) {
		this.conname=conname;
		this.conde=conde;
	}
	public Integer getConno() {
		return conno;
	}
	public void setConno(Integer conno) {
		this.conno = conno;
	}
	public int getRestno() {
		return restno;
	}
	public void setRestno(int restno) {
		this.restno = restno;
	}
	public String getConname() {
		return conname;
	}
	public void setConname(String conname) {
		this.conname = conname;
	}
	public String getConde() {
		return conde;
	}
	public void setConde(String conde) {
		this.conde = conde;
	}
	
	
}
