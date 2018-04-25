package cn.jxufe.service;

import cn.jxufe.dao.UserDao;
import cn.jxufe.domain.User;

public class UserService {
	private UserDao userdao;
	public void setUserdao(UserDao userdao) {
		this.userdao = userdao;
	}
	public User login(User user) {
		return userdao.findByUsernameAndPassword(user);
	}
	public User register(User user) {
		return userdao.save(user);
	}
	public boolean usernameIsvalid(String username) {
		return userdao.findByUsername(username) == null;
	}
	public void update(User user) {
		userdao.update(user);
	}
}
