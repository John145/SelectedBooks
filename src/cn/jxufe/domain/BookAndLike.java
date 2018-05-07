package cn.jxufe.domain;

import java.util.Set;

public class BookAndLike {
	private Book book;
	private String isLike;
	private Set<MessageBoard> messageBoards;
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public String getIsLike() {
		return isLike;
	}
	public void setIsLike(String isLike) {
		this.isLike = isLike;
	}
	public Set<MessageBoard> getMessageBoards() {
		return messageBoards;
	}
	public void setMessageBoards(Set<MessageBoard> messageBoards) {
		this.messageBoards = messageBoards;
	}
	
}
