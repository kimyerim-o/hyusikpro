package member.command;
/*
 * 페이지 이동을 처리하기위한 클래스
 */
public class ActionForword {
	private boolean isRedirect =false;
	private String nextPath = null;//이동할 다음 화면
	
	
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getNextPath() {
		return nextPath;
	}
	public void setNextPath(String nextPath) {
		this.nextPath = nextPath;
	}
	
}
