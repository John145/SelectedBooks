package cn.jxufe.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.jxufe.domain.Book;
import cn.jxufe.domain.User;

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

	public List<Book> findByPageAndKeyword(int begin, int pageSize,DetachedCriteria criteria) {
		List<Book> list = this.getHibernateTemplate().findByCriteria(criteria,begin,pageSize);
		return list;
	}

	public void delCountByKeyword(int bid) {
		// TODO Auto-generated method stub
		String hql = "delete from Book where bid =" +bid+"";
		System.out.println(hql);
		Book book = findById(bid);
		this.getHibernateTemplate().delete(book);
	}
	/**
	 * 通过bid查询book对象
	 */
	public Book findById(int bid) {
		String hql = "from Book where bid=?";
		List<Book> list = this.getHibernateTemplate().find(hql,bid);
		if(list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
	public void update(Book book) {
		this.getHibernateTemplate().update(book);
	}
	/**
	 * 通过类型查找相应的书籍，然后对点击量进行降序排序
	 * @param interest
	 * @return
	 */
	public List<Book> findByType(String interest) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Book.class);
		criteria.add(Restrictions.eq("sort", interest));
		criteria.addOrder(Order.desc("clickNumber"));
		criteria.addOrder(Order.desc("publishYear"));
		criteria.addOrder(Order.desc("score"));
		criteria.addOrder(Order.desc("price"));
		List<Book> list = this.getHibernateTemplate().findByCriteria(criteria);
		return list;
	}

	public List<Book> findByClickNumber() {
//		String hql = "from Book order by clickNumber desc";
//		List<Book> list = this.getHibernateTemplate().find(hql);
//		return list;
		DetachedCriteria criteria = DetachedCriteria.forClass(Book.class);
		criteria.addOrder(Order.desc("clickNumber"));
		criteria.addOrder(Order.desc("publishYear"));
		criteria.addOrder(Order.desc("score"));
		criteria.addOrder(Order.desc("price"));
		criteria.getExecutableCriteria(getSession()).setMaxResults(10);
		List<Book> list = this.getHibernateTemplate().findByCriteria(criteria);
		return list;
	}
	public void add(Book book) {
		this.getHibernateTemplate().save(book);
	}

	public void delete(Book book) {
		this.getHibernateTemplate().delete(book);
	}

	public int findCountBySort(String sort) {
		String hql = "select count(*) from Book where sort like ?";
		List<Long> list = this.getHibernateTemplate().find(hql,"%"+sort+"%");
		if(list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	public List<Book> findByPageAndSort(int begin, int pageSize, String sort) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Book.class);
		criteria.add(Restrictions.like("sort","%"+sort+"%"));
		List<Book> list = this.getHibernateTemplate().findByCriteria(criteria,begin,pageSize);
		return list;
	}
}
