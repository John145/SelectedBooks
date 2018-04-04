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
	public void register(User user) {
		userdao.save(user);
	}
	public boolean usernameIsvalid(String username) {
		return userdao.findByUsername(username) == null;
	}
}
