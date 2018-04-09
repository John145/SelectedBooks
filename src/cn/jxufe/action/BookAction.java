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
}
