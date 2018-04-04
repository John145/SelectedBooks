package cn.jxufe.domain;

import java.util.HashSet;
import java.util.Set;

public class Role {
	private Integer rid;
	private String rname;
	
	private Set<User> users = new HashSet<User>();
	
	public Integer getRid() {
		return rid;
	}
	public void setRid(Integer rid) {
		this.rid = rid;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	
}
