package com.firedogs.grandpringles.vo;

public class PageVO {
	private int start, end;
	private String order, type;
	
	public PageVO() {
		
	}
	
	

	public String getOrder() {
		return order;
	}



	public void setOrder(String order) {
		this.order = order;
	}



	public PageVO(int pageNo, int numPage) {
		end = pageNo*numPage;
		start = (pageNo-1)*numPage+1 ;
	}


	public PageVO(int pageNo, int numPage, String order) {
		end = pageNo*numPage;
		start = (pageNo-1)*numPage+1 ;
		this.order = order;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}
	
	
	
	
}
