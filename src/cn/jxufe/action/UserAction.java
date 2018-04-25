package cn.jxufe.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

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
	public String chooseInterest() {
		User curUser = (User) ActionContext.getContext().getSession().get("curUser");
		curUser.setSex(user.getSex());
		curUser.setInterests(user.getInterests());
		userService.update(curUser);
		return "chooseInterest";
	}
	public String login() {
		System.out.println("请求登陆");
		if(!checkCode.toLowerCase().equals(ActionContext.getContext().getSession().get("checkCode"))) {
			this.addActionError("验证码错误!");
			return INPUT;
		}
		User curUser = userService.login(user);
		
		if(curUser == null) {
			this.addActionError("用户名密码错误!");
			return INPUT;
		}else if(curUser.getRole().getRname().equals("注册用户")) {
			ActionContext.getContext().getSession().put("curUser", curUser);
			return SUCCESS;
		}else if(curUser.getRole().getRname().equals("书籍管理员")) {
			ActionContext.getContext().getSession().put("curUser", curUser);
			return "BookAdmin";
		}else if(curUser.getRole().getRname().equals("用户管理员")) {
			ActionContext.getContext().getSession().put("curUser", curUser);
			return "UserAdmin";
		}
		return null;
	}
	public String logout() {
		ServletActionContext.getRequest().getSession().invalidate();
		return "logout";
	}
	private String checkCode;
	public void setCheckCode(String checkCode) {
		this.checkCode = checkCode;
	}
	public String register() {
		System.out.println("注册用户："+user);
		if(!checkCode.toLowerCase().equals(ActionContext.getContext().getSession().get("checkCode"))) {
			this.addActionError("注册失败（验证码错误）");
			return "register";
		}
		if(user.getUsername().equals("") || !userService.usernameIsvalid(user.getUsername()) ||
				user.getPassword().equals("")) {
			this.addActionError("注册失败（用户名和密码输入格式有误）");
			return "register";
		}
		Role role = new Role();
		role.setRid(1);
		user.setRole(role);
		User curUser = userService.register(user);
		ActionContext.getContext().getSession().put("curUser", curUser);
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
