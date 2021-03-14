package mybean.data;
public class Message_Bean {
	String username;
	String text;
	
	public void setUsername(String s) {
		username = s.trim();
	}
	public String getUsername() {
		return username;
	}
	public void setText(String s) {
		text = s.trim();
	}
	public String getText() {
		return text;
	}
}
