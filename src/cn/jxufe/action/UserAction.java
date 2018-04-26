package cn.jxufe.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.jxufe.domain.Book;
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
		System.out.println("�����½");
		if(!checkCode.toLowerCase().equals(ActionContext.getContext().getSession().get("checkCode"))) {
			this.addActionError("��֤�����!");
			return INPUT;
		}
		User curUser = userService.login(user);
		
		if(curUser == null) {
			this.addActionError("�û����������!");
			return INPUT;
		}else if(curUser.getRole().getRname().equals("ע���û�")) {
			ActionContext.getContext().getSession().put("curUser", curUser);
			return SUCCESS;
		}else if(curUser.getRole().getRname().equals("�鼮����Ա")) {
			ActionContext.getContext().getSession().put("curUser", curUser);
			return "BookAdmin";
		}else if(curUser.getRole().getRname().equals("�û�����Ա")) {
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
		System.out.println("ע���û���"+user);
		if(!checkCode.toLowerCase().equals(ActionContext.getContext().getSession().get("checkCode"))) {
			this.addActionError("ע��ʧ�ܣ���֤�����");
			return "register";
		}
		if(user.getUsername().equals("") || !userService.usernameIsvalid(user.getUsername()) ||
				user.getPassword().equals("")) {
			this.addActionError("ע��ʧ�ܣ��û��������������ʽ����");
			return "register";
		}
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
	private Integer bid;
	public void setBid(Integer bid) {
		this.bid = bid;
	}
	public String addBook() {
		//����ղ��鼮
		User curUser = (User) ActionContext.getContext().getSession().get("curUser");
		userService.addBook(curUser.getUid(),bid);
		try {
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "ajax-success";
	}
	public String removeBook() {
		//ɾ���ղ��鼮
		User curUser = (User) ActionContext.getContext().getSession().get("curUser");
		userService.removeBook(curUser.getUid(),bid);
		try {
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "ajax-success";
	}
}
