package review.dto;

import java.util.Date;

public class ReviewDto {
	private int reno;
	private String name;
	private Date redate;
	private String stdate;
	private String repw;
	private String recontent;
	
	private int restno;
	private String restname;
	private Double restis;
	
	
	public ReviewDto() {}

	public String getStdate() {
		return stdate;
	}

	public void setStdate(String stdate) {
		this.stdate = stdate;
	}


	public ReviewDto(int restno, String restname, double restis) {
		this.restno=restno;
		this.restname=restname;
		this.restis=restis;
	}
	
	public int getReno() {
		return reno;
	}

	public void setReno(int reno) {
		this.reno = reno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getRestno() {
		return restno;
	}

	public void setRestno(int restno) {
		this.restno = restno;
	}

	public String getRestname() {
		return restname;
	}

	public void setRestname(String restname) {
		this.restname = restname;
	}

	public Date getRedate() {
		return redate;
	}

	public void setRedate(Date redate) {
		this.redate = redate;
	}

	public String getRepw() {
		return repw;
	}

	public void setRepw(String repw) {
		this.repw = repw;
	}

	public String getRecontent() {
		return recontent;
	}

	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}

	public Double getRestis() {
		return restis;
	}

	public void setRestis(Double restis) {
		this.restis = restis;
	}

	public boolean hasPassword() {
		return repw != null && !repw.isEmpty();
	}
	
	public boolean matchPassword(String password) {
		return repw != null && repw.equals(password);
	}

	@Override
	public String toString() {
		return "ReviewDTO [reno=" + reno + ", name=" + name + ", restno=" + restno + ", restname=" + restname
				+ ", redate=" + redate + ", repw=" + repw + ", recontent=" + recontent + ", restis=" + restis + "]";
	}

	
	
	
}