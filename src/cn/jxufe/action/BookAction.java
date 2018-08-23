package cn.jxufe.action;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.jxufe.domain.Book;
import cn.jxufe.domain.BookAndLike;
import cn.jxufe.domain.MessageBoard;
import cn.jxufe.domain.PageBean;
import cn.jxufe.domain.SelectedBooks;
import cn.jxufe.domain.User;
import cn.jxufe.service.BookService;


public class BookAction extends ActionSupport implements ModelDriven<Book> {
	private static final long serialVersionUID = 1L;
	private Book book = new Book();
	@Override
	public Book getModel() {
		return book;
	}
	
	private BookService bookService;
	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}

	private InputStream inputStream;
	public InputStream getInputStream() {
		return inputStream;
	}
	private String msgTime;
	private String msgContent;
	public void setMsgTime(String msgTime) {
		this.msgTime = msgTime;
	}
	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}
	/**
	 * 通过调用bat文件命令，操作python程序爬取新数据
	 */
	private String filePath;
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String spider() {
		System.out.println("spider");
		Runtime run = Runtime.getRuntime();     
	    try {     
	        Process process = run.exec("cmd.exe /k start " + filePath);  
	        Thread.sleep(2000);
	        process.destroy();    
	    } catch (Exception e) {              
	        e.printStackTrace();     
	    }
		return "BookAdmin";
	}
	/**
	 * 添加留言功能
	 * @return
	 */
	public String addMessageBoard() {
		MessageBoard messageBoard = new MessageBoard();
		messageBoard.setContent(msgContent);
		messageBoard.setTime(msgTime);
		User curUser = (User) ActionContext.getContext().getSession().get("curUser");
		bookService.addMessageBoard(messageBoard,book.getBid(),curUser.getUid());
		try {
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "ajax-success";
	}
	
	/**
	 * 推荐图书
	 */
	public String selected() {
		User curUser = (User) ActionContext.getContext().getSession().get("curUser");
		if(curUser.getInterests() == null || curUser.getInterests() == "") {
			return "chooseInterest";
		}
		SelectedBooks selectedBooks = bookService.selected(curUser.getUid());
		ActionContext.getContext().getValueStack().push(selectedBooks);
		return "selected";
	}
	
	
	
	private Integer curPage;
	public void setCurPage(Integer curPage) {
		this.curPage = curPage;
	}
	public Integer getCurPage() {
		return curPage;
	}
	
	public String findAll() {
		PageBean<Book> pageBean = bookService.findByPage(curPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		User user = (User) ActionContext.getContext().getSession().get("curUser");
		if(user.getRole().getRname().equals("注册用户")){
			return "findAll";
		}else if(user.getRole().getRname().equals("书籍管理员")) {
			return "BookAdminfindAll";
		}else {
			System.out.println("用户管理员");
			return "UserAdminfindAll";
		}
	}
	
	
	
	private String keyword;
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getKeyword() {
		return keyword;
	}
	public String search() {
		DetachedCriteria criteria = DetachedCriteria.forClass(Book.class);
		criteria.add(Restrictions.like("bookName","%"+keyword+"%"));
		PageBean<Book> pageBean = bookService.findByKeyword(keyword,curPage,criteria);
		ActionContext.getContext().getValueStack().push(pageBean);
		User user = (User) ActionContext.getContext().getSession().get("curUser");
		if(user.getRole().getRname().equals("注册用户")){
			return "search";
		}else {
			return "AdminSearch";
		}
	}
	/**
	 * search the book by the plisheryear
	 * @return
	 */
	public String searchByNew() {
		DetachedCriteria criteria = DetachedCriteria.forClass(Book.class);
		criteria.add(Restrictions.like("bookName","%"+keyword+"%"));
		criteria.addOrder(Order.desc("publishYear"));
		PageBean<Book> pageBean = bookService.findByKeyword(keyword,curPage,criteria);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "searchByNew";
	}
	/**
	 * search the book by the score
	 * @return
	 */
	public String searchByScore() {
		DetachedCriteria criteria = DetachedCriteria.forClass(Book.class);
		criteria.add(Restrictions.like("bookName","%"+keyword+"%"));
		criteria.addOrder(Order.desc("score"));
		PageBean<Book> pageBean = bookService.findByKeyword(keyword,curPage,criteria);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "searchByScore";
	}
	/**
	 * search the book by the price
	 * @return
	 */
	public String searchByPrice() {
		DetachedCriteria criteria = DetachedCriteria.forClass(Book.class);
		criteria.add(Restrictions.like("bookName","%"+keyword+"%"));
		criteria.addOrder(Order.desc("price"));
		PageBean<Book> pageBean = bookService.findByKeyword(keyword,curPage,criteria);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "searchByPrice";
	}
	/**
	 * search the books by the sort of the book
	 * @return
	 */
	public String searchBySort() {
		PageBean<Book> pageBean = bookService.findBySort(book.getSort(), curPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "searchBySort";
	}

	public String delete() {
		bookService.delete(book);
//		System.out.println(book.getBid());
//		PageBean<Book> pageBean = bookService.delByKeyword(book.getBid(),curPage);
//		ActionContext.getContext().getValueStack().push(pageBean);
//		System.out.println("delete()");
		return "delete";
	}
	public String detail() {
		int bid = book.getBid();
		User curUser = (User)ActionContext.getContext().getSession().get("curUser");
		Integer uid = curUser.getUid(); 
		BookAndLike bookAndLike = bookService.findById(bid,uid);
		ActionContext.getContext().getValueStack().push(bookAndLike);
		return "detail";
	}
	public String AdminUpdate() {
		int bid = book.getBid();
		User curUser = (User) ActionContext.getContext().getSession().get("curUser");
		BookAndLike bookAndLike = bookService.findById(bid,curUser.getUid());
		Book book = bookAndLike.getBook();
		ActionContext.getContext().getValueStack().push(book);
		return "AdminUpdate";
	}
	public String update() {
		bookService.update(book);
		return "update";
	}
	public String Adminadd() {
		return "Adminadd";
	}
	public String add() {
		//判断书本是否为空数据，否则不让增加
		
		book.setClickNumber(0);
		book.setTags("");
		bookService.add(book);
		return "add";
	}
	public String AdminSearch() {
		return "AdminSearch";
	}
}
