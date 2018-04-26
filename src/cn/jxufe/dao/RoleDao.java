package cn.jxufe.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.jxufe.domain.Role;

public class RoleDao extends HibernateDaoSupport {
	public Role get(Integer rid) {
		String hql = "from Role where rid=?";
		List<Role> list = this.getHibernateTemplate().find(hql,rid);
		if(list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
}
