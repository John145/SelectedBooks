package cn.jxufe.domain;

public class MessageBoard {
	private Integer mid;
	private String time;
	private String content;
	
	private User user;
	
	private Book book;

	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	@Override
	public String toString() {
		return "MessageBoard [mid=" + mid + ", time=" + time + ", content=" + content + "]";
	}
	
}
