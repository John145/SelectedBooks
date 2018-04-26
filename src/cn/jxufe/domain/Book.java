package cn.jxufe.domain;

import java.util.HashSet;
import java.util.Set;

public class Book {
	private Integer bid;
	private String picUrl;
	private String bookName;
	private String author;
	private String publisher;
	private String translator;
	private String publishYear;
	private String pages;
	private String price;
	private String score;
	private String assessNumber;
	private String readUrl;
	private String contentIntroduce;
	private String authorIntroduce;
	private String tags;
	private Integer clickNumber;
	
	public Integer getClickNumber() {
		return clickNumber;
	}
	public void setClickNumber(Integer clickNumber) {
		this.clickNumber = clickNumber;
	}
	private Set<User> users = new HashSet<User>(0);
	
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	public Integer getBid() {
		return bid;
	}
	public void setBid(Integer bid) {
		this.bid = bid;
	}
	public String getPicUrl() {
		return picUrl;
	}
	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getTranslator() {
		return translator;
	}
	public void setTranslator(String translator) {
		this.translator = translator;
	}
	public String getPublishYear() {
		return publishYear;
	}
	public void setPublishYear(String publishYear) {
		this.publishYear = publishYear;
	}
	public String getPages() {
		return pages;
	}
	public void setPages(String pages) {
		this.pages = pages;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getAssessNumber() {
		return assessNumber;
	}
	public void setAssessNumber(String assessNumber) {
		this.assessNumber = assessNumber;
	}
	public String getReadUrl() {
		return readUrl;
	}
	public void setReadUrl(String readUrl) {
		this.readUrl = readUrl;
	}
	public String getContentIntroduce() {
		return contentIntroduce;
	}
	public void setContentIntroduce(String contentIntroduce) {
		this.contentIntroduce = contentIntroduce;
	}
	public String getAuthorIntroduce() {
		return authorIntroduce;
	}
	public void setAuthorIntroduce(String authorIntroduce) {
		this.authorIntroduce = authorIntroduce;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	@Override
	public String toString() {
		return "Book [bid=" + bid + ", picUrl=" + picUrl + ", bookName=" + bookName + ", author=" + author
				+ ", publisher=" + publisher + ", translator=" + translator + ", publishYear=" + publishYear
				+ ", pages=" + pages + ", price=" + price + ", score=" + score + ", assessNumber=" + assessNumber
				+ ", readUrl=" + readUrl + ", contentIntroduce=" + contentIntroduce + ", authorIntroduce="
				+ authorIntroduce + ", tags=" + tags + ", clickNumber=" + clickNumber + "]";
	}
	
}
