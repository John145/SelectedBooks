package cn.jxufe.service;

import java.util.List;

import cn.jxufe.dao.BookDao;
import cn.jxufe.domain.Book;
import cn.jxufe.domain.PageBean;

public class BookService {
	private BookDao bookDao;
	public void setBookDao(BookDao bookDao) {
		this.bookDao = bookDao;
	}
	public PageBean<Book> findByPage(Integer curPage) {
		PageBean<Book> pageBean = new PageBean<Book>();
		
		//当前页数
		pageBean.setCurPage(curPage);
		//每页显示多少条记录
		int pageSize = 10;
		pageBean.setPageSize(pageSize);
		//总记录数
		int totalCount = bookDao.findCount();
		pageBean.setTotalCount(totalCount);
		//总页数
		int num =(int)Math.ceil((double)totalCount / pageSize);
		pageBean.setTotalPage(num);
		//每页显示的数据
		int begin = (curPage - 1) * pageSize;
		List<Book> books = bookDao.findByPage(begin,pageSize);
		pageBean.setList(books);//blm000222
		return pageBean;
	}
	public PageBean<Book> findByKeyword(String keyword ,Integer curPage) {
		PageBean<Book> pageBean = new PageBean<Book>();
		//当前页数
		pageBean.setCurPage(curPage);
		//每页显示多少条记录
		int pageSize = 10;
		pageBean.setPageSize(pageSize);
		//总记录数
		int totalCount = bookDao.findCountByKeyword(keyword);
		System.out.println(totalCount);
		pageBean.setTotalCount(totalCount);
		//总页数
		int num =(int)Math.ceil((double)totalCount / pageSize);
		pageBean.setTotalPage(num);
		//每页显示的数据
		int begin = (curPage - 1) * pageSize;
		List<Book> books = bookDao.findByPageAndKeyword(begin,pageSize,keyword);
		pageBean.setList(books);//blm000222
		return pageBean;
	}
}
