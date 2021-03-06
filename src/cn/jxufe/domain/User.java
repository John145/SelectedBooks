package cn.jxufe.domain;

import java.util.HashSet;
import java.util.Set;

public class User {
	private Integer uid;
	private String username;
	private String password;
	private String sex;
	private String nickname;
	private String email;
	private String address;
	private String interests;
	private String headPic;
	
	private Set<MessageBoard> messageBoards = new HashSet<MessageBoard>(0);
	
	
	public Set<MessageBoard> getMessageBoards() {
		return messageBoards;
	}

	public void setMessageBoards(Set<MessageBoard> messageBoards) {
		this.messageBoards = messageBoards;
	}

	private Set<ChatRoomMsg> chatRoomMsgs = new HashSet<ChatRoomMsg>(0);
	
	
	public Set<ChatRoomMsg> getChatRoomMsgs() {
		return chatRoomMsgs;
	}

	public void setChatRoomMsgs(Set<ChatRoomMsg> chatRoomMsgs) {
		this.chatRoomMsgs = chatRoomMsgs;
	}

	private Set<Book> books = new HashSet<Book>(0);
	
	public Set<Book> getBooks() {
		return books;
	}

	public void setBooks(Set<Book> books) {
		this.books = books;
	}

	public String getInterests() {
		return interests;
	}

	public void setInterests(String interests) {
		this.interests = interests;
	}

	private Role role;

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getHeadPic() {
		return headPic;
	}

	public void setHeadPic(String headPic) {
		this.headPic = headPic;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", password=" + password + ", sex=" + sex + ", nickname="
				+ nickname + ", email=" + email + ", address=" + address + ", interests=" + interests + ", headPic="
				+ headPic + "]";
	}
	
}
