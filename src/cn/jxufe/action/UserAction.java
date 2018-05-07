package cn.jxufe.action;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Set;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.jxufe.domain.Book;
import cn.jxufe.domain.PageBean;
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
	/**
	 * ��ȡ�ղ��б�
	 */
	public String getAllCollection() {
		User curUser = (User) ActionContext.getContext().getSession().get("curUser");
		Set<Book> list = userService.getAllCollection(curUser.getUid());
		ActionContext.getContext().getValueStack().set("list", list);
		return "collection";
	}
	/**
	 * �ϴ��ļ�
	 * @return
	 */
	private File file;
	private String fileFileName;
	private String fileContentType;
	
	public void setFile(File file) {
		this.file = file;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	public String upload() {
//		System.out.println(file+fileFileName+fileContentType);
		ServletContext servletContext = ServletActionContext.getServletContext();
        //���û���ļ��н���һ������
        File test = new File(servletContext.getRealPath("/files"));
        if(!test.exists()) file.mkdirs();
        //���ļ����б������
        try {
        	//�������һ���ļ���
        	long random = new Date().getTime();
			FileOutputStream out = new FileOutputStream(servletContext.getRealPath("/files/")+random+fileFileName);
			FileInputStream in = new FileInputStream(file);
			byte[] buffer = new byte[1024];
			int len = 0;
			while((len = in.read(buffer)) != -1) {
				out.write(buffer,0,len);
			}
			in.close();
			out.close();
			//���ؽ��
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
			
			//����user
			User curUser = (User) ActionContext.getContext().getSession().get("curUser");
			curUser.setHeadPic("files/"+random+fileFileName);
			userService.update(curUser);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "ajax-success";
	}
	/**
	 * �޸��û���Ϣ
	 * @return
	 */
	public String update() {
		User curUser = (User) ActionContext.getContext().getSession().get("curUser");
		curUser.setSex(user.getSex());
		curUser.setNickname(user.getNickname());
		curUser.setEmail(user.getEmail());
		curUser.setAddress(user.getAddress());
		curUser.setInterests(user.getInterests());
		userService.update(curUser);
		this.addActionMessage("�޸ĳɹ�������");
		return "update";
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
		//锟斤拷锟斤拷詹锟斤拷榧�
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
		//删锟斤拷锟秸诧拷锟介籍
		User curUser = (User) ActionContext.getContext().getSession().get("curUser");
		userService.removeBook(curUser.getUid(),bid);
		try {
			inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "ajax-success";
	}
	public String personalinformation() {
		//锟介籍锟斤拷锟斤拷员锟斤拷示锟斤拷锟斤拷锟斤拷息
		User curUser = (User) ActionContext.getContext().getSession().get("curUser");
		ActionContext.getContext().getValueStack().push(curUser);
		return "information";
	}
	public String informationupdate() {
		//锟睫革拷锟斤拷锟斤拷锟矫伙拷锟斤拷息
		User usernew = new User();
		usernew = userService.updateAdminBook(user);
		ActionContext.getContext().getSession().put("curUser", user);
		return "informationupdate";
	}
	private Integer curPage;
	public void setCurPage(Integer curPage) {
		this.curPage = curPage;
	}
	public String findAll() {
		PageBean<User> pageBean = userService.findByPage(curPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		User curUser = (User) ActionContext.getContext().getSession().get("curUser");
		ActionContext.getContext().getValueStack().push(curUser);
		return "findAll";
	}
	public String findAll_register() {
		PageBean<User> pageBean = userService.findByPage_register(curPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		User curUser = (User) ActionContext.getContext().getSession().get("curUser");
		ActionContext.getContext().getValueStack().push(curUser);
		return "findAll_register";
	}
	public String findAll_bookadmin() {
		PageBean<User> pageBean = userService.findByPage_bookAdmin(curPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		User curUser = (User) ActionContext.getContext().getSession().get("curUser");
		ActionContext.getContext().getValueStack().push(curUser);
		return "findAll_bookadmin";
	}
	public String delete() {
		System.out.println(user.getUid());
		PageBean<User> pageBean = userService.delByKeyword(user.getUid(),curPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		System.out.println("delete()");
		return "delete";
	}
	
}
