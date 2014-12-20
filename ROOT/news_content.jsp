<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="teachDB.DbBean" %>
<%@ page import="StringFormat.pattern" %>
<%!
 private String  getTitle(String title){
 		String shortString = "";
       		if( title.length()> 10)
       			shortString = title.substring(0,10)+"...";
       		else
       			shortString = title;
       		return 	shortString;
        }
private Object[]  getValue(List sqllist,String[] volumn){
 		Object[] rValue = new Object[volumn.length];
       		for(int i=0;i<sqllist.size();i++){
			Map map = (Map) sqllist.get(i);
				for(int j=0;j<rValue.length;j++){
					rValue[j] = map.get(volumn[j]);
				}
			}
       		return 	rValue;
        }
%>
<%
	request.setCharacterEncoding("UTF-8");
	int idx = Integer.parseInt((String)request.getParameter("id"));
	DbBean db = new DbBean();
	List newslist = null;
	List forwardlist = null;
	List backwardlist = null;
	Object[] nowValue = null;
	Object[] forwardValue = null;
 	Object[] backwardValue = null;
	String[] nowvolum = {"n_order","n_title","n_content","n_date"};
	String[] othervolum = {"n_order","n_title"};
	List AllNews = db.SelectRS("select * from newslist where deleteflag = 0 order by n_order ");
	int newscount = AllNews.size();
	List idList = new ArrayList();
	idList.add(idx);
	 newslist = db.SelectRSwhere("select * from newslist where n_order = ? and deleteflag = 0",idList);
	if(idx > 1){
		List fidList = new ArrayList();
		fidList.add(idx-1);
	 	forwardlist = db.SelectRSwhere("select * from newslist where n_order = ? and deleteflag = 0",fidList);
		forwardValue = getValue(forwardlist,othervolum);
	}
	if(idx < newscount){
		List bidList = new ArrayList();
		bidList.add(idx+1);
	 	backwardlist = db.SelectRSwhere("select * from newslist where n_order = ? and deleteflag = 0",bidList);
		backwardValue = getValue(backwardlist,othervolum);
	}	
    nowValue = getValue(newslist,nowvolum);
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>測試</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>
    <div id="container">
        <header>
        	<div class="logo"><img src="images/logo.png" width="70" height="48" alt="眾騰會計師事務所" border="0"></div>
            <div class="company">測試</div>
        </header>
        <nav>
        	<ul>
            	<li class="m-1"><a href="about.html" target="_self">關於我們</a></li>
                <li class="m-2"><a href="service.html" target="_self">服務項目</a></li>
                <li class="m-3"><a href="price.html" target="_self">收費標準</a></li>
                <li class="m-4"><a href="qa.html" target="_self">常用問題</a></li>
                <li class="m-5"><a href="link.html" target="_self">常用連結</a></li>
                <li class="m-6"><a href="contact.html" target="_self">聯絡我們</a></li>
            </ul>
        </nav>
        <div id="slider">
        	<img src="img/img_03.png" width="100%" border="0" id="img1">
            <img src="img/img_04.png" width="100%" border="0" id="img2">
        </div>
        <article>
        <aside class="aside-left-1">
            <div class="content">
            <form>
            	<div class="content-t"><%=(String)nowValue[1]%></div>
                <div class="content-time"><%=(java.sql.Date)nowValue[3]%></div>
                <div class="content-c">
              <%=(String)nowValue[2]%>
                </div>
                <div class="button-pn">
                	<%if(idx > 1){%>
                    <div class="pre-news">上一則：<a href="news_content.jsp?id=<%=(Integer)forwardValue[0]%>" target="_self" title="<%=(String)forwardValue[1]%>"><%=getTitle((String)forwardValue[1])%></a></div>
                    <%}%>
                    <%if(idx < newscount){%>
                    <div class="next-news">下一則：<a href="news_content.jsp?id=<%=(Integer)backwardValue[0]%>" target="_self" title="<%=(String)backwardValue[1]%>"><%=getTitle((String)backwardValue[1])%></a></div>
                    <%}%>
                </div>
            </form>
            </div>
        </aside>
        <aside class="aside-right-1">
        	<ul id="right-icon">
            	<li><div class="ricon icon-1"></div>設立流程</li>
                <li><div class="ricon icon-2"></div>服務時程</li>
                <li><div class="ricon icon-3"></div>公司與行號<br>的差別</li>
                <li><div class="ricon icon-4"></div>文件下載</li>
            </ul>
        </aside>
        </article>
        <footer></footer>
    </div>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.backgroundPosition.js"></script>
<script src="js/cs.js"></script>
<script>
(function(){
	
	$(window).resize(function() {
		$('article').css({height:$('.content').height()+100});
	}).trigger('resize');
	
	$('.pageButton').css({width:($('.pageNumber').width()+217),marginLeft:-$('.pageButton').width()/2});
		
})();
</script>
</body>
</html>
