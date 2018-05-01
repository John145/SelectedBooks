package cn.jxufe.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.jxufe.domain.ChatRoomMsg;

public class ChatRoomMsgDao extends HibernateDaoSupport {
	public void save(ChatRoomMsg chatRoomMsg) {
		this.getHibernateTemplate().save(chatRoomMsg);
	}
	public List<ChatRoomMsg> findAll() {
		String hql = "from ChatRoomMsg";
		List<ChatRoomMsg> list = this.getHibernateTemplate().find(hql);
		return list;
	}
}
