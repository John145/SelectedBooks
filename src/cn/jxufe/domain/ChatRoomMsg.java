package cn.jxufe.domain;

public class ChatRoomMsg {
	private Integer cid;
	private String headPic;
	private String nickName;
	private String time;
	private String content;
	
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getHeadPic() {
		return headPic;
	}
	public void setHeadPic(String headPic) {
		this.headPic = headPic;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
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
	@Override
	public String toString() {
		return "ChatRoomMsg [cid=" + cid + ", headPic=" + headPic + ", nickName=" + nickName + ", time=" + time
				+ ", content=" + content + "]";
	}
	
}
