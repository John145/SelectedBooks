package cn.jxufe.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

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
	 * �Ƽ�ͼ��
	 */
	public String selected() {
		User curUser = (User) ActionContext.getContext().getSession().get("curUser");
		//�����û�û��ѡ����Ȥ���ã����ý���������
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
	
	public String findAll() {
		PageBean<Book> pageBean = bookService.findByPage(curPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		User user = (User) ActionContext.getContext().getSession().get("curUser");
		if(user.getRole().getRname().equals("注册用户")){
			return "findAll";
		}else {
			return "AdminfindAll";
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
		PageBean<Book> pageBean = bookService.findByKeyword(keyword,curPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		User user = (User) ActionContext.getContext().getSession().get("curUser");
		if(user.getRole().getRname().equals("注册用户")){
			return "search";
		}else {
			return "AdminSearch";
		}
	}
	

	public String delete() {
		System.out.println(book.getBid());
		PageBean<Book> pageBean = bookService.delByKeyword(book.getBid(),curPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		System.out.println("delete()");
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
		System.out.println("bookActionupdate");
		System.out.println(book);
		bookService.update(book);
		return "update";
	}
	public String Adminadd() {
		return "Adminadd";
	}
	public String add() {
		bookService.add(book);
		return "add";
	}
	public String AdminSearch() {
		return "AdminSearch";
	}
}
