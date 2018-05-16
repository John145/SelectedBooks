package cn.jxufe.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.jxufe.domain.Book;
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
	 * �����û�
	 * @param user
	 */
	public void update(User user) {
		this.getHibernateTemplate().update(user);
	}
	/**
	 * ����UID��ȡuser
	 */
	public User get(Integer uid) {
		String hql = "from User where uid=?";
		List<User> list = this.getHibernateTemplate().find(hql,uid);
		if(list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
	public int findCount() {
		String hql = "select count(*) from User where rid = 1";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}
	public List<User> findByPage(int begin, int pageSize) {
		DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
		criteria.add(Restrictions.eq("role.rid", new Integer(1)));
		List<User> list = this.getHibernateTemplate().findByCriteria(criteria,begin,pageSize);
		return list;
	}
	
	public int findCount_register() {
		String hql = "select count(*) from User where RID=1";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}
	public List<User> findByPage_register(int begin, int pageSize) {
		DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
		criteria.add(Restrictions.eq("role.rid",new Integer(1)));
		List<User> list = this.getHibernateTemplate().findByCriteria(criteria,begin,pageSize);
		return list;
	}
	public int findCount_bookadmin() {
		String hql = "select count(*) from User where RID=3";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}
	public List<User> findByPage_bookadmin(int begin, int pageSize) {
		DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
		criteria.add(Restrictions.eq("role.rid",new Integer(3)));
		List<User> list = this.getHibernateTemplate().findByCriteria(criteria,begin,pageSize);
		return list;
	}
	

	public void delete(User user) {
		this.getHibernateTemplate().delete(user);
	}

	private User findById(Integer uid) {
		// TODO Auto-generated method stub
		String hql = "from User where uid=?";
		List<User> list = this.getHibernateTemplate().find(hql,uid);
		if(list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
}
