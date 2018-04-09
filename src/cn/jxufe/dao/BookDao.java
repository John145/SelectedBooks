package cn.jxufe.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.jxufe.domain.Book;

public class BookDao extends HibernateDaoSupport {

	public int findCount() {
		String hql = "select count(*) from Book";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	public List<Book> findByPage(int begin, int pageSize) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Book.class);
		List<Book> list = this.getHibernateTemplate().findByCriteria(criteria,begin,pageSize);
		return list;
	}

}
