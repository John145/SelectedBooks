package cn.jxufe.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

import cn.jxufe.domain.User;

public class LoginInterceptor extends MethodFilterInterceptor {
	private static final long serialVersionUID = 1L;
	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		System.out.println("��½������");
		User curUser = (User) ActionContext.getContext().getSession().get("curUser");
		if(curUser != null) {
			return invocation.invoke();
		}else {
			return "input";
		}
	}

}
