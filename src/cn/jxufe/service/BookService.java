package cn.jxufe.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.opensymphony.xwork2.ActionContext;

import cn.jxufe.dao.BookDao;
import cn.jxufe.dao.MessageBoardDao;
import cn.jxufe.dao.UserDao;
import cn.jxufe.domain.Book;
import cn.jxufe.domain.BookAndLike;
import cn.jxufe.domain.MessageBoard;
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
	private MessageBoardDao messageBoardDao;
	public void setMessageBoardDao(MessageBoardDao messageBoardDao) {
		this.messageBoardDao = messageBoardDao;
	}
	public PageBean<Book> findByPage(Integer curPage) {
		PageBean<Book> pageBean = new PageBean<Book>();
		
		//ï¿½ï¿½Ç°Ò³ï¿½ï¿½
		pageBean.setCurPage(curPage);
		//Ã¿Ò³ï¿½ï¿½Ê¾ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Â¼
		int pageSize = 10;
		pageBean.setPageSize(pageSize);
		//ï¿½Ü¼ï¿½Â¼ï¿½ï¿½
		int totalCount = bookDao.findCount();
		pageBean.setTotalCount(totalCount);
		//ï¿½ï¿½Ò³ï¿½ï¿½
		int num =(int)Math.ceil((double)totalCount / pageSize);
		pageBean.setTotalPage(num);
		//Ã¿Ò³ï¿½ï¿½Ê¾ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
		int begin = (curPage - 1) * pageSize;
		List<Book> books = bookDao.findByPage(begin,pageSize);
		pageBean.setList(books);//blm000222
		return pageBean;
	}
	public PageBean<Book> findByKeyword(String keyword ,Integer curPage) {
		PageBean<Book> pageBean = new PageBean<Book>();
		//ï¿½ï¿½Ç°Ò³ï¿½ï¿½
		pageBean.setCurPage(curPage);
		//Ã¿Ò³ï¿½ï¿½Ê¾ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Â¼
		int pageSize = 10;
		pageBean.setPageSize(pageSize);
		//ï¿½Ü¼ï¿½Â¼ï¿½ï¿½
		int totalCount = bookDao.findCountByKeyword(keyword);
		pageBean.setTotalCount(totalCount);
		//ï¿½ï¿½Ò³ï¿½ï¿½
		int num =(int)Math.ceil((double)totalCount / pageSize);
		pageBean.setTotalPage(num);
		//Ã¿Ò³ï¿½ï¿½Ê¾ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
		int begin = (curPage - 1) * pageSize;
		List<Book> books = bookDao.findByPageAndKeyword(begin,pageSize,keyword);
		pageBean.setList(books);//blm000222
		return pageBean;
	}
	public PageBean<Book> delByKeyword(int bid, Integer curPage) {
		// TODO Auto-generated method stub
		PageBean<Book> pageBean = new PageBean<Book>();
		//ï¿½ï¿½Ç°Ò³ï¿½ï¿½
		pageBean.setCurPage(curPage);
		//Ã¿Ò³ï¿½ï¿½Ê¾ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½Â¼
		int pageSize = 10;
		pageBean.setPageSize(pageSize);
		
		//É¾ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
		bookDao.delCountByKeyword(bid);
		
		int totalCount = bookDao.findCount();
		//ï¿½ï¿½Ò³ï¿½ï¿½
		int num =(int)Math.ceil((double)totalCount / pageSize);
		pageBean.setTotalPage(num);
		//Ã¿Ò³ï¿½ï¿½Ê¾ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
		int begin = (curPage - 1) * pageSize;
		List<Book> books = bookDao.findByPage(begin,pageSize);
		pageBean.setList(books);//blm000222
		return pageBean;
	}
	public BookAndLike findById(int bid,int uid) {
		BookAndLike bookAndLike = new BookAndLike();
		Book book = bookDao.findById(bid);
		//Êé¼®Ôö¼ÓÒ»µã»÷Á¿
		book.setClickNumber(book.getClickNumber()+1);
		bookDao.update(book);
		bookAndLike.setBook(book);
		//²éÕÒÓÃ»§ÊÕ²ØµÄÊé¼®
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
		//²éÕÒÁôÑÔ
		Set<MessageBoard> messageBoards = book.getMessageBoards();
		bookAndLike.setMessageBoards(messageBoards);
		return bookAndLike;
	}
	/**
	 * ¸ù¾ÝÓÃ»§µÄÐËÈ¤ÍÆ¼öÏàÓ¦µÄÊé¼®
	 * @param uid
	 * @return
	 */
	public SelectedBooks selected(Integer uid) {
		SelectedBooks selectedBooks = new SelectedBooks();
		selectedBooks.setBooks(new ArrayList<Book>());
		//1¡¢»ñÈ¡ÓÃ»§µÄÐËÈ¤°®ºÃ
		User user = userDao.get(uid);
		String[] interests = user.getInterests().split("#");
		//2¡¢±éÀúinterests£¬²éÕÒÏàÓ¦µÄÁ½±¾Êé¼®
		//Ð¡Ëµ#ÎÄÑ§#¹ù¾´Ã÷#¾­µä#ÀúÊ·#
		for(String interest : interests) {
			List<Book> books = bookDao.findByType(interest);
			if(books.size() < 2) {
				//0±¾»òÕß1±¾
				for(int i = 0; i < books.size(); i++) {
					selectedBooks.getBooks().add(books.get(i));
				}
			}else {
				selectedBooks.getBooks().add(books.get(0));
				selectedBooks.getBooks().add(books.get(1));
			}
		}
		//3¡¢»ñÈ¡ËùÓÐÍ¼ÊéµÄÅÅÐÐ°ñÇ°Ê®
		List<Book> phb = bookDao.findByClickNumber();
		selectedBooks.setPhb(phb.subList(0, 10));
		//ÅÐ¶ÏÊÇ·ñÓÐ10±¾ÍÆ¼öµÄÊé¼®,Èç¹û²»¹»¾ÍÈ¥ÅÅÐÐ°ñÄÃÇ°¼¸±¾
		int tmp = selectedBooks.getBooks().size();
		if(selectedBooks.getBooks().size() < 10) {
			for(int i = 0; i < 10-tmp;i++) {
				selectedBooks.getBooks().add(phb.get(i));
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
