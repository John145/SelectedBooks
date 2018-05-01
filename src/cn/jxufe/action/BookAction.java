package cn.jxufe.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.jxufe.domain.Book;
import cn.jxufe.domain.BookAndLike;
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
	/**
	 * 推荐图书
	 */
	public String selected() {
		User curUser = (User) ActionContext.getContext().getSession().get("curUser");
		//可能用户没有选择兴趣爱好，则不让进入主界面
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
		if(user.getRole().getRname().equals("注册用户")) {
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
		return "search";
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
}
