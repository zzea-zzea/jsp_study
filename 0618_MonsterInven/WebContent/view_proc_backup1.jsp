<%@page import="java.util.Enumeration"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); //post %>

<% 
	String player = request.getParameter("player");
	String mname = request.getParameter("mname");
	
	String key = player + "." + mname;
	System.out.println("key => " + key);
	
	HashMap<String,String> monster = (HashMap<String,String>)
			application.getAttribute(key);
	
	// application 내장객체
	/* 
	Enumeration<String> keys =
			application.getAttributeNames();
	while( keys.hasMoreElements() == true ) {
		String aKey = keys.nextElement();
		System.out.println( "key : " + aKey);
	} 
	*/
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		@import url("css/main.css");
	</style>
</head>
<body>
	<div id='header'>
		<%@ include file="common/_header.jsp" %>
	</div>
	<div id='main'>
		<!-- 플레이어명과 몬스터명 양쪽 다 없을 때.. -->
		<% if((player == null && mname == null) || key.equals(".") ) { %>
			<h3 class="error">
				플레이어명.몬스터명 입력이 empty라 조회 불가능!
			</h3>
		<% } else if(mname == null || mname.isEmpty()) { %>
		<!-- 플레이어 명만 있을 때 -->
			<% Enumeration<String> keys =
					application.getAttributeNames();
			while( keys.hasMoreElements() == true ) {
				String aKey = keys.nextElement();
				if( aKey.startsWith(player) ) {
					monster = (HashMap<String,String>)
							application.getAttribute(aKey); %>					
					<div class='moncard'>
						<h4>플레이어명: <span class='player'>'
							<%= monster.get("player") %>'님</span></h4>
						<ul>
							<li>몬스터 이름: <%= monster.get("mname") %></li>
							<li>몬스터 이미지: <small><%= monster.get("mpic") %></small>
								<img src='<%= monster.get("mpic") %>'
										 alt="<%= monster.get("mname") %>">
							</li>
							<li>몬스터 능력치: <%= monster.get("mabil") %>power</li>
							<li>몬스터 속성: <%= monster.get("mtype") %></li>
							<li>등록 날자시간: <%= monster.get("mdatetime") %>
						</ul>	
					</div>										
			 <% } // if 
			} // while %>
		<% } else if(player == null || player.isEmpty()) {%>
		<!-- 몬스터 이름만 있을 때 -->
			<% Enumeration<String> keys =
					application.getAttributeNames();
			while( keys.hasMoreElements() == true ) {
				String aKey = keys.nextElement();
				if( aKey.endsWith(mname) ) {
					monster = (HashMap<String,String>)
							application.getAttribute(aKey); %>					
					<div class='moncard'>
						<h4>플레이어명: <span class='player'>'
							<%= monster.get("player") %>'님</span></h4>
						<ul>
							<li>몬스터 이름: <%= monster.get("mname") %></li>
							<li>몬스터 이미지: <small><%= monster.get("mpic") %></small>
								<img src='<%= monster.get("mpic") %>'
										 alt="<%= monster.get("mname") %>">
							</li>
							<li>몬스터 능력치: <%= monster.get("mabil") %>power</li>
							<li>몬스터 속성: <%= monster.get("mtype") %></li>
							<li>등록 날자시간: <%= monster.get("mdatetime") %>
						</ul>	
					</div>										
			 <% } // if 
			} // while %>
	
	
		<!-- 플레이어명과 몬스터명 양쪽 다 있을 때.. -->
		<% } else { // else %>
			<% if(monster != null) { %>
			
			<div class='moncard'>
				<h4>플레이어명: <span class='player'>'
					<%= monster.get("player") %>'님</span></h4>
				<ul>
					<li>몬스터 이름: <%= monster.get("mname") %></li>
					<li>몬스터 이미지: <small><%= monster.get("mpic") %></small>
						<img src='<%= monster.get("mpic") %>'
								 alt="<%= monster.get("mname") %>">
					</li>
					<li>몬스터 능력치: <%= monster.get("mabil") %>power</li>
					<li>몬스터 속성: <%= monster.get("mtype") %></li>
					<li>등록 날자시간: <%= monster.get("mdatetime") %>
				</ul>	
			</div>
			
			<% } else { %>
				<h3 class="error">
					플레이어명.몬스터명 키로 일치하는 등록 결과가 없음!
				</h3>
			<% } %>
		<% } // else %>	
	</div>
	<div id='footer'>
		<%@ include file="common/_footer.jsp" %>	
	</div>
</body>
</html>