package review.dto;

public class ReviewDto {
	private String restno;
	private String restname;
	private String redate;
	private double restis;
	
	public ReviewDto(String restno,String restname, double restis) {
		this.setRestno(restno);
		this.restname=restname;
		this.restis=restis;
	}
	public String getRestname() {
		return restname;
	}
	public void setRestname(String restname) {
		this.restname = restname;
	}
	public String getRedate() {
		return redate;
	}
	public void setRedate(String redate) {
		this.redate = redate;
	}
	public double getRestis() {
		return restis;
	}
	public void setRestis(int restis) {
		this.restis = restis;
	}

	public String getRestno() {
		return restno;
	}

	public void setRestno(String restno) {
		this.restno = restno;
	}
	
	
}
