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

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

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
