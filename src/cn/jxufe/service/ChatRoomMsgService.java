package cn.jxufe.service;

import java.util.List;

import cn.jxufe.dao.ChatRoomMsgDao;
import cn.jxufe.domain.ChatRoomMsg;

public class ChatRoomMsgService {
	private ChatRoomMsgDao chatRoomMsgDao;
	public void setChatRoomMsgDao(ChatRoomMsgDao chatRoomMsgDao) {
		this.chatRoomMsgDao = chatRoomMsgDao;
	}
	
	public void save(ChatRoomMsg chatRoomMsg) {
		chatRoomMsgDao.save(chatRoomMsg);
	}

	public List<ChatRoomMsg> findAll() {
		return chatRoomMsgDao.findAll();
	}
	
}
