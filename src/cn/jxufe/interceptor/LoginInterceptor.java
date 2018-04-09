package cn.jxufe.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

import cn.jxufe.domain.User;

public class LoginInterceptor extends AbstractInterceptor {
	private static final long serialVersionUID = 1L;
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		System.out.println("��½������");
		User existUser = (User) ActionContext.getContext().getSession().get("existUser");
		if(existUser != null) {
			return invocation.invoke();
		}else {
			return "error";
		}
	}

}
