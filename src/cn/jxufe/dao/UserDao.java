package cn.jxufe.dao;

import java.io.Serializable;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.jxufe.domain.User;

public class UserDao extends HibernateDaoSupport {

	public User findByUsernameAndPassword(User user) {
		String hql = "from User where username=? and password=?";
		List<User> list = this.getHibernateTemplate().find(hql,user.getUsername(),user.getPassword());
		if(list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public User save(User user) {
		Serializable s = this.getHibernateTemplate().save(user);
		return this.getHibernateTemplate().get(User.class, s);
	}

	public User findByUsername(String username) {
		String hql = "from User where username=?";
		List<User> list = this.getHibernateTemplate().find(hql,username);
		if(list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
	/**
	 * 更新用户
	 * @param user
	 */
	public void update(User user) {
		this.getHibernateTemplate().update(user);
	}
	/**
	 * 根据UID获取user
	 */
	public User get(Integer uid) {
		String hql = "from User where uid=?";
		List<User> list = this.getHibernateTemplate().find(hql,uid);
		if(list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
}
