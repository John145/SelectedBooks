package cn.jxufe.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.opensymphony.xwork2.ActionContext;

import cn.jxufe.dao.BookDao;
import cn.jxufe.dao.UserDao;
import cn.jxufe.domain.Book;
import cn.jxufe.domain.BookAndLike;
import cn.jxufe.domain.PageBean;
import cn.jxufe.domain.SelectedBooks;
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
	public PageBean<Book> delByKeyword(int bid, Integer curPage) {
		// TODO Auto-generated method stub
		PageBean<Book> pageBean = new PageBean<Book>();
		//当前页数
		pageBean.setCurPage(curPage);
		//每页显示多少条记录
		int pageSize = 10;
		pageBean.setPageSize(pageSize);
		
		//删除操作
		bookDao.delCountByKeyword(bid);
		
		int totalCount = bookDao.findCount();
		//总页数
		int num =(int)Math.ceil((double)totalCount / pageSize);
		pageBean.setTotalPage(num);
		//每页显示的数据
		int begin = (curPage - 1) * pageSize;
		List<Book> books = bookDao.findByPage(begin,pageSize);
		pageBean.setList(books);//blm000222
		return pageBean;
	}
	public BookAndLike findById(int bid,int uid) {
		BookAndLike bookAndLike = new BookAndLike();
		Book book = bookDao.findById(bid);
		//书籍增加一点击量
		book.setClickNumber(book.getClickNumber()+1);
		bookDao.update(book);
		bookAndLike.setBook(book);
		//查找用户收藏的书籍
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
	/**
	 * 根据用户的兴趣推荐相应的书籍
	 * @param uid
	 * @return
	 */
	public SelectedBooks selected(Integer uid) {
		SelectedBooks selectedBooks = new SelectedBooks();
		selectedBooks.setBooks(new ArrayList<Book>());
		//1、获取用户的兴趣爱好
		User user = userDao.get(uid);
		String[] interests = user.getInterests().split("#");
		//2、遍历interests，查找相应的两本书籍
		for(String interest : interests) {
			List<Book> books = bookDao.findByType(interest);
			selectedBooks.getBooks().add(books.get(0));
			selectedBooks.getBooks().add(books.get(1));
		}
		//3、获取所有图书的排行榜前十
		List<Book> phb = bookDao.findByClickNumber();
		selectedBooks.setPhb(phb.subList(0, 10));
		return selectedBooks;
	}
}
