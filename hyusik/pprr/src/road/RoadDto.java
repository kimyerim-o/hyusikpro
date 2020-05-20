package road;

public class RoadDto {
	private Integer rono;
	private String sitname;
	private String direction;
	private String msg;
	private String type;
	private int blocktype;
	private String startday;
	
	
	public RoadDto(String sitname, String direction, String msg, String type, String startday, int blocktype) {
		this.sitname=sitname;
		this.direction=direction;
		this.msg=msg;
		this.type=type;
		this.blocktype=blocktype;
		this.startday=startday;
	}
	public Integer getRono() {
		return rono;
	}
	public void setRono(Integer rono) {
		this.rono = rono;
	}
	public String getSitname() {
		return sitname;
	}
	public void setSitname(String sitname) {
		this.sitname = sitname;
	}
	public String getDirection() {
		return direction;
	}
	public void setDirection(String direction) {
		this.direction = direction;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getBlocktype() {
		return blocktype;
	}
	public void setBlocktype(int blocktype) {
		this.blocktype = blocktype;
	}
	public String getStartday() {
		return startday;
	}
	public void setStartday(String startday) {
		this.startday = startday;
	}
	
	
}
