package cn.jxufe.action;


import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.jxufe.domain.ChatRoomMsg;
import cn.jxufe.domain.User;
import cn.jxufe.service.ChatRoomMsgService;

public class ChatRoomMsgAction extends ActionSupport implements ModelDriven<ChatRoomMsg> {
	private ChatRoomMsg chatRoomMsg = new ChatRoomMsg();
	@Override
	public ChatRoomMsg getModel() {
		return chatRoomMsg;
	}
	private ChatRoomMsgService chatRoomMsgService;
	public void setChatRoomMsgService(ChatRoomMsgService chatRoomMsgService) {
		this.chatRoomMsgService = chatRoomMsgService;
	}
	private InputStream inputStream;
	public InputStream getInputStream() {
		return inputStream;
	}
	public String save() {
		User curUser = (User) ActionContext.getContext().getSession().get("curUser");
		chatRoomMsgService.save(chatRoomMsg,curUser);
		try {
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "ajax-success";
	}
	public String findAll(){
		List<ChatRoomMsg> list = chatRoomMsgService.findAll();
		ActionContext.getContext().getValueStack().set("list", list);; //将消息列表放入值栈中
		return "findAll";
	}
}
