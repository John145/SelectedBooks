package cn.jxufe.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.jxufe.domain.Role;
import cn.jxufe.domain.User;
import cn.jxufe.service.UserService;

public class UserAction extends ActionSupport implements ModelDriven<User> {
	private static final long serialVersionUID = 1L;
	private User user = new User();
	@Override
	public User getModel() {
		return user;
	}
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public String login() {
		System.out.println("请求登陆");
		User curUser = userService.login(user);
		if(curUser == null) {
			this.addActionError("用户名密码错误!");
			return INPUT;
		}else {
			ActionContext.getContext().getSession().put("curUser", curUser);
			return SUCCESS;
		}
	}
	public String register() {
		System.out.println("注册用户："+user);
		if(user.getUsername().equals("") || !userService.usernameIsvalid(user.getUsername()) ||
				user.getPassword().equals("")) {
			this.addActionError("注册失败（用户名和密码输入格式有误）");
			return "register";
		}
		Role role = new Role();
		role.setRid(1);
		user.setRole(role);
		userService.register(user);
		return "registerSuccess";
	}
	private InputStream inputStream;
	public InputStream getInputStream() {
		return inputStream;
	}
	public String validateUsername() {
		try {
			if(userService.usernameIsvalid(user.getUsername())) {
				inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
			}else {
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "ajax-success";
	}
}
