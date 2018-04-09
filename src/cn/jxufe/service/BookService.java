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
		System.out.println(totalCount);
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
}
