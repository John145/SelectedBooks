package cn.jxufe.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
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

	public int findCountByKeyword(String keyword) {
		String hql = "select count(*) from Book where bookName like ?";
		List<Long> list = this.getHibernateTemplate().find(hql,"%"+keyword+"%");
		if(list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	public List<Book> findByPageAndKeyword(int begin, int pageSize,String keyword) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Book.class);
		criteria.add(Restrictions.like("bookName","%"+keyword+"%"));
		List<Book> list = this.getHibernateTemplate().findByCriteria(criteria,begin,pageSize);
		return list;
	}

	public Book findById(int bid) {
		String hql = "from Book where bid=?";
		List<Book> list = this.getHibernateTemplate().find(hql,bid);
		if(list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

}
