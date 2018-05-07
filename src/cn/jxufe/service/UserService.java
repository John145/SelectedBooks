package cn.jxufe.service;

import java.util.Set;

import cn.jxufe.dao.BookDao;
import cn.jxufe.dao.RoleDao;
import cn.jxufe.dao.UserDao;
import cn.jxufe.domain.Book;
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
		//����Ĭ�����ͷ��
		int random = (int) (Math.random()*9+1);
		user.setHeadPic("img/headPic/head0"+random+".jpg");
		//Ĭ������Ϊע���û�Ȩ��
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
	/**
	 * ��ȡ�ղص��鼮
	 */
	public Set<Book> getAllCollection(Integer uid){
		User user = userdao.get(uid);
		return user.getBooks();
	}
}
