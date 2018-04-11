package cn.jxufe.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.jxufe.domain.Book;
import cn.jxufe.domain.PageBean;
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
	private Integer curPage;
	public void setCurPage(Integer curPage) {
		this.curPage = curPage;
	}
	
	public String findAll() {
		PageBean<Book> pageBean = bookService.findByPage(curPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "findAll";
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
	
	public String detail() {
		int bid = book.getBid();
		Book book = bookService.findById(bid);
		ActionContext.getContext().getValueStack().push(book);
		return "detail";
	}
}
