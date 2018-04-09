package cn.jxufe.domain;

import java.util.List;

public class PageBean<T> {
	private int curPage; //��ǰҳ��
	private int pageSize; //ÿҳ��ʾ��������¼
	private int totalCount; //�ܼ�¼��
	private int totalPage; //��ҳ��
	private List<T> list; //ÿҳ��ʾ������
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	
}
