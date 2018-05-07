package cn.jxufe.service;

import java.util.List;

import cn.jxufe.dao.BookDao;
import cn.jxufe.dao.RoleDao;
import cn.jxufe.dao.UserDao;
import cn.jxufe.domain.Book;
import cn.jxufe.domain.PageBean;
import cn.jxufe.domain.Role;
import cn.jxufe.domain.User;

public class UserService {
	private UserDao userdao;
	public void setUserdao(UserDao userdao) {
		this.userdao = userdao;
	}
	private RoleDao roleDao;
	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}
	private BookDao bookDao;
	public void setBookDao(BookDao bookDao) {
		this.bookDao = bookDao;
	}
	public User login(User user) {
		return userdao.findByUsernameAndPassword(user);
	}
	public User register(User user) {
		//默锟斤拷锟斤拷锟斤拷为注锟斤拷锟矫伙拷权锟斤拷
		Role role = roleDao.get(1);
		user.setRole(role);
		return userdao.save(user);
	}
	public boolean usernameIsvalid(String username) {
		return userdao.findByUsername(username) == null;
	}
	public void update(User user) {
		userdao.update(user);
	}
	public void addBook(Integer uid, Integer bid) {
		User user = userdao.get(uid);
		Book book = bookDao.findById(bid);
		user.getBooks().add(book);
		userdao.update(user);
	}
	public void removeBook(Integer uid, Integer bid) {
		User user = userdao.get(uid);
		Book book = bookDao.findById(bid);
		user.getBooks().remove(book);
		userdao.update(user);
	}
	public User updateAdminBook(User user) {
		Role role = roleDao.get(3);
		user.setRole(role);
		userdao.update(user);
		return userdao.get(user.getUid());
	}
	public PageBean<User> findByPage(Integer curPage) {
		PageBean<User> pageBean = new PageBean<User>();
		//锟斤拷前页锟斤拷
		pageBean.setCurPage(curPage);
		//每页锟斤拷示锟斤拷锟斤拷锟斤拷锟斤拷录
		int pageSize = 10;
		pageBean.setPageSize(pageSize);
		//锟杰硷拷录锟斤拷
		int totalCount = userdao.findCount();
		pageBean.setTotalCount(totalCount);
		//锟斤拷页锟斤拷
		int num =(int)Math.ceil((double)totalCount / pageSize);
		pageBean.setTotalPage(num);
		//每页锟斤拷示锟斤拷锟斤拷锟斤拷
		int begin = (curPage - 1) * pageSize;
		List<User> users = userdao.findByPage(begin,pageSize);
		pageBean.setList(users);//blm000222
		return pageBean;
	}
	public PageBean<User> findByPage_register(Integer curPage) {
		//鐢ㄤ簬鐢ㄦ埛绠＄悊鍛樻煡璇㈠叏閮ㄧ殑娉ㄥ唽鐢ㄦ埛
		PageBean<User> pageBean = new PageBean<User>();
		//锟斤拷前页锟斤拷
		pageBean.setCurPage(curPage);
		//每页锟斤拷示锟斤拷锟斤拷锟斤拷锟斤拷录
		int pageSize = 10;
		pageBean.setPageSize(pageSize);
		//锟杰硷拷录锟斤拷
		int totalCount = userdao.findCount_register();
		pageBean.setTotalCount(totalCount);
		//锟斤拷页锟斤拷
		int num =(int)Math.ceil((double)totalCount / pageSize);
		pageBean.setTotalPage(num);
		//每页锟斤拷示锟斤拷锟斤拷锟斤拷
		int begin = (curPage - 1) * pageSize;
		List<User> users = userdao.findByPage_register(begin,pageSize);
		pageBean.setList(users);//blm000222
		return pageBean;
	}
	public PageBean<User> findByPage_bookAdmin(Integer curPage) {
		////鐢ㄤ簬鐢ㄦ埛绠＄悊鍛樻煡璇㈠叏閮ㄧ殑涔︾睄绠＄悊鍛�
		PageBean<User> pageBean = new PageBean<User>();
		//锟斤拷前页锟斤拷
		pageBean.setCurPage(curPage);
		//每页锟斤拷示锟斤拷锟斤拷锟斤拷锟斤拷录
		int pageSize = 10;
		pageBean.setPageSize(pageSize);
		//锟杰硷拷录锟斤拷
		int totalCount = userdao.findCount_bookadmin();
		pageBean.setTotalCount(totalCount);
		//锟斤拷页锟斤拷
		int num =(int)Math.ceil((double)totalCount / pageSize);
		pageBean.setTotalPage(num);
		//每页锟斤拷示锟斤拷锟斤拷锟斤拷
		int begin = (curPage - 1) * pageSize;
		List<User> users = userdao.findByPage_bookadmin(begin,pageSize);
		pageBean.setList(users);//blm000222
		return pageBean;
	}
	
	public PageBean<User> delByKeyword(Integer uid, Integer curPage) {
		PageBean<User> pageBean = new PageBean<User>();
		//锟斤拷前页锟斤拷
		pageBean.setCurPage(curPage);
		//每页锟斤拷示锟斤拷锟斤拷锟斤拷锟斤拷录
		int pageSize = 10;
		pageBean.setPageSize(pageSize);
		
		//删锟斤拷锟斤拷锟斤拷
		userdao.delCountByKeyword(uid);
		
		int totalCount = userdao.findCount();
		//锟斤拷页锟斤拷
		int num =(int)Math.ceil((double)totalCount / pageSize);
		pageBean.setTotalPage(num);
		//每页锟斤拷示锟斤拷锟斤拷锟斤拷
		int begin = (curPage - 1) * pageSize;
		List<User> users = userdao.findByPage(begin,pageSize);
		pageBean.setList(users);//blm000222
		return pageBean;
	}
}
