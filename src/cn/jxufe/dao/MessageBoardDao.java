package cn.jxufe.dao;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.jxufe.domain.MessageBoard;

public class MessageBoardDao extends HibernateDaoSupport {

	public void save(MessageBoard messageBoard) {
		this.getHibernateTemplate().save(messageBoard);
	}
	
}
