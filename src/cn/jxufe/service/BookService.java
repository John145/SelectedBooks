package cn.jxufe.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.hibernate.criterion.DetachedCriteria;

import cn.jxufe.dao.BookDao;
import cn.jxufe.dao.MessageBoardDao;
import cn.jxufe.dao.UserDao;
import cn.jxufe.domain.Book;
import cn.jxufe.domain.BookAndLike;
import cn.jxufe.domain.MessageBoard;
import cn.jxufe.domain.PageBean;
import cn.jxufe.domain.SelectedBooks;
import cn.jxufe.domain.User;
import cn.jxufe.util.Recommend;

public class BookService {
	private BookDao bookDao;
	public void setBookDao(BookDao bookDao) {
		this.bookDao = bookDao;
	}
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	private MessageBoardDao messageBoardDao;
	public void setMessageBoardDao(MessageBoardDao messageBoardDao) {
		this.messageBoardDao = messageBoardDao;
	}
	public PageBean<Book> findByPage(Integer curPage) {
		PageBean<Book> pageBean = new PageBean<Book>();
		
		//锟斤拷前页锟斤拷
		pageBean.setCurPage(curPage);
		//每页锟斤拷示锟斤拷锟斤拷锟斤拷锟斤拷录
		int pageSize = 10;
		pageBean.setPageSize(pageSize);
		//锟杰硷拷录锟斤拷
		int totalCount = bookDao.findCount();
		pageBean.setTotalCount(totalCount);
		//锟斤拷页锟斤拷
		int num =(int)Math.ceil((double)totalCount / pageSize);
		pageBean.setTotalPage(num);
		//每页锟斤拷示锟斤拷锟斤拷锟斤拷
		int begin = (curPage - 1) * pageSize;
		List<Book> books = bookDao.findByPage(begin,pageSize);
		pageBean.setList(books);//blm000222
		return pageBean;
	}
	public PageBean<Book> findByKeyword(String keyword ,Integer curPage,DetachedCriteria criteria) {
		PageBean<Book> pageBean = new PageBean<Book>();
		//锟斤拷前页锟斤拷
		pageBean.setCurPage(curPage);
		//每页锟斤拷示锟斤拷锟斤拷锟斤拷锟斤拷录
		int pageSize = 10;
		pageBean.setPageSize(pageSize);
		//锟杰硷拷录锟斤拷
		int totalCount = bookDao.findCountByKeyword(keyword);
		pageBean.setTotalCount(totalCount);
		//锟斤拷页锟斤拷
		int num =(int)Math.ceil((double)totalCount / pageSize);
		pageBean.setTotalPage(num);
		//每页锟斤拷示锟斤拷锟斤拷锟斤拷
		int begin = (curPage - 1) * pageSize;
		List<Book> books = bookDao.findByPageAndKeyword(begin,pageSize,criteria);
		pageBean.setList(books);//blm000222
		return pageBean;
	}
	public PageBean<Book> findBySort(String sort ,Integer curPage) {
		PageBean<Book> pageBean = new PageBean<Book>();
		//锟斤拷前页锟斤拷
		pageBean.setCurPage(curPage);
		//每页锟斤拷示锟斤拷锟斤拷锟斤拷锟斤拷录
		int pageSize = 10;
		pageBean.setPageSize(pageSize);
		//锟杰硷拷录锟斤拷
		int totalCount = bookDao.findCountBySort(sort);
		pageBean.setTotalCount(totalCount);
		//锟斤拷页锟斤拷
		int num =(int)Math.ceil((double)totalCount / pageSize);
		pageBean.setTotalPage(num);
		//每页锟斤拷示锟斤拷锟斤拷锟斤拷
		int begin = (curPage - 1) * pageSize;
		List<Book> books = bookDao.findByPageAndSort(begin,pageSize,sort);
		pageBean.setList(books);//blm000222
		return pageBean;
	}
	public BookAndLike findById(int bid,int uid) {
		BookAndLike bookAndLike = new BookAndLike();
		Book book = bookDao.findById(bid);
		//锟介籍锟斤拷锟斤拷一锟斤拷锟斤拷锟�
		book.setClickNumber(book.getClickNumber()+1);
		bookDao.update(book);
		bookAndLike.setBook(book);
		//锟斤拷锟斤拷锟矫伙拷锟秸藏碉拷锟介籍
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
		//锟斤拷锟斤拷锟斤拷锟斤拷
		Set<MessageBoard> messageBoards = book.getMessageBoards();
		bookAndLike.setMessageBoards(messageBoards);
		return bookAndLike;
	}
	/**
	 * 锟斤拷锟斤拷锟矫伙拷锟斤拷锟斤拷趣锟狡硷拷锟斤拷应锟斤拷锟介籍
	 * @param uid
	 * @return
	 */
	public SelectedBooks selected(Integer uid) {
		SelectedBooks selectedBooks = new SelectedBooks();
		selectedBooks.setBooks(new ArrayList<Book>());
		//1、获取用户的兴趣爱好
		User user = userDao.get(uid);
		List<User> users = userDao.findByPage_register(0,userDao.findCount_register());
		
		if(user.getBooks().size() > 0) {
			//推荐算法
			List<Integer> tuijian = Recommend.tuijian(users,user);
			System.out.println(tuijian.toString());
			for(Integer bid : tuijian) {
				selectedBooks.getBooks().add(bookDao.findById(bid));
			}
		}
		
		String[] interests = user.getInterests().split("#");
		//2、遍历interests，查找相应的两本书籍
		//小说#文学#郭敬明#经典#历史#
		for(String interest : interests) {
			List<Book> books = bookDao.findByType(interest);
			if(books.size() < 2) {
				//0本或者1本
				for(int i = 0; i < books.size(); i++) {
					selectedBooks.getBooks().add(books.get(i));
				}
			}else {
				selectedBooks.getBooks().add(books.get(0));
				selectedBooks.getBooks().add(books.get(1));
			}
		}
		//3、获取所有图书的排行榜前十
		List<Book> phb = bookDao.findByClickNumber();
		selectedBooks.setPhb(phb.subList(0, 10));
		//判断是否有10本推荐的书籍,如果不够就去排行榜拿前几本
		int tmp = selectedBooks.getBooks().size();
		if(selectedBooks.getBooks().size() < 10) {
			for(int i = 0; i < 10-tmp;i++) {
				selectedBooks.getBooks().add(phb.get(i));
			}
		}else {
			//删除多余的数据
			for(int i = 0; i < tmp-10;i++) {
				selectedBooks.getBooks().remove(selectedBooks.getBooks().get(selectedBooks.getBooks().size()-1));
			}
		}
		return selectedBooks;
	}
	public void update(Book book) {
		bookDao.update(book);
	}
	public void add(Book book) {
		bookDao.add(book);
	}
	public void addMessageBoard(MessageBoard messageBoard, Integer bid, Integer uid) {
		User user = userDao.get(uid);
		messageBoard.setUser(user);
		Book book = bookDao.findById(bid);
		messageBoard.setBook(book);
		messageBoardDao.save(messageBoard);
	}
	public void delete(Book book) {
		bookDao.delete(book);
	}
}
