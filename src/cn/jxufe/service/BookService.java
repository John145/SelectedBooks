package cn.jxufe.service;

import java.util.List;
import java.util.Set;

import com.opensymphony.xwork2.ActionContext;

import cn.jxufe.dao.BookDao;
import cn.jxufe.dao.UserDao;
import cn.jxufe.domain.Book;
import cn.jxufe.domain.BookAndLike;
import cn.jxufe.domain.PageBean;
import cn.jxufe.domain.User;

public class BookService {
	private BookDao bookDao;
	public void setBookDao(BookDao bookDao) {
		this.bookDao = bookDao;
	}
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	public PageBean<Book> findByPage(Integer curPage) {
		PageBean<Book> pageBean = new PageBean<Book>();
		
		//��ǰҳ��
		pageBean.setCurPage(curPage);
		//ÿҳ��ʾ��������¼
		int pageSize = 10;
		pageBean.setPageSize(pageSize);
		//�ܼ�¼��
		int totalCount = bookDao.findCount();
		pageBean.setTotalCount(totalCount);
		//��ҳ��
		int num =(int)Math.ceil((double)totalCount / pageSize);
		pageBean.setTotalPage(num);
		//ÿҳ��ʾ������
		int begin = (curPage - 1) * pageSize;
		List<Book> books = bookDao.findByPage(begin,pageSize);
		pageBean.setList(books);//blm000222
		return pageBean;
	}
	public PageBean<Book> findByKeyword(String keyword ,Integer curPage) {
		PageBean<Book> pageBean = new PageBean<Book>();
		//��ǰҳ��
		pageBean.setCurPage(curPage);
		//ÿҳ��ʾ��������¼
		int pageSize = 10;
		pageBean.setPageSize(pageSize);
		//�ܼ�¼��
		int totalCount = bookDao.findCountByKeyword(keyword);
		pageBean.setTotalCount(totalCount);
		//��ҳ��
		int num =(int)Math.ceil((double)totalCount / pageSize);
		pageBean.setTotalPage(num);
		//ÿҳ��ʾ������
		int begin = (curPage - 1) * pageSize;
		List<Book> books = bookDao.findByPageAndKeyword(begin,pageSize,keyword);
		pageBean.setList(books);//blm000222
		return pageBean;
	}
	public PageBean<Book> delByKeyword(int bid, Integer curPage) {
		// TODO Auto-generated method stub
		PageBean<Book> pageBean = new PageBean<Book>();
		//��ǰҳ��
		pageBean.setCurPage(curPage);
		//ÿҳ��ʾ��������¼
		int pageSize = 10;
		pageBean.setPageSize(pageSize);
		
		//ɾ������
		bookDao.delCountByKeyword(bid);
		
		int totalCount = bookDao.findCount();
		//��ҳ��
		int num =(int)Math.ceil((double)totalCount / pageSize);
		pageBean.setTotalPage(num);
		//ÿҳ��ʾ������
		int begin = (curPage - 1) * pageSize;
		List<Book> books = bookDao.findByPage(begin,pageSize);
		pageBean.setList(books);//blm000222
		return pageBean;
	}
	public BookAndLike findById(int bid,int uid) {
		BookAndLike bookAndLike = new BookAndLike();
		Book book = bookDao.findById(bid);
		//�鼮����һ�����
		book.setClickNumber(book.getClickNumber()+1);
		bookDao.update(book);
		bookAndLike.setBook(book);
		//�����û��ղص��鼮
		User user = userDao.get(uid);
		Set<Book> books = user.getBooks();
		String isLike = "no";
		for(Book likeBook : books) {
			if(likeBook.getBid() == bid) {
				isLike = "yes";
				break;
			}
		}
		bookAndLike.setIsLike(isLike);
		return bookAndLike;
	}
	public void update(Book book) {
		bookDao.update(book);
	}
	public void add(Book book) {
		// TODO Auto-generated method stub
		bookDao.add(book);
	}
}
