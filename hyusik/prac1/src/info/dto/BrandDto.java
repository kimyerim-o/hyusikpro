package info.dto;

public class BrandDto {
	private Integer brandno;
	private int restno;
	private String brandname;
	private String brandde;
	
	public BrandDto(String brandname, String brandde) {
		this.brandname=brandname;
		this.brandde=brandde;
	}
	
	public Integer getBrandno() {
		return brandno;
	}
	public void setBrandno(Integer brandno) {
		this.brandno = brandno;
	}
	public int getRestno() {
		return restno;
	}
	public void setRestno(int restno) {
		this.restno = restno;
	}
	public String getBrandname() {
		return brandname;
	}
	public void setBrandname(String brandname) {
		this.brandname = brandname;
	}
	public String getBrandde() {
		return brandde;
	}
	public void setBrandde(String brandde) {
		this.brandde = brandde;
	}


}
