<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="teachDB.DbBean" %>
<%@ page import="StringFormat.pattern" %>
<%!
 private String  getTitle(String title){
 		String shortString = "";
       		if(title.length() > 20)
       			shortString = title.substring(0,20)+"...";
       		else
       			shortString = title;
       		return 	shortString;
        }
%>
<%
	DbBean db = new DbBean();
	List showNews = db.SelectRS("select * from newslist where deleteflag = 0 order by n_order ");
	String[] NewsAll;
	String[] NewsArray;
	String[] NewsIdx;
	if(showNews.size() > 6 ){
		NewsAll = new String[6];
		NewsArray = new String[6];
		NewsIdx = new String[6];
	}else{
		NewsAll = new String[showNews.size()];
		NewsArray = new String[showNews.size()];
		NewsIdx = new String[showNews.size()];
		}
	for(int i=0;i<NewsArray.length;i++){
		Map map = (Map) showNews.get(i);
			NewsAll[i] =(String) map.get( "n_title");
			NewsArray[i] =getTitle((String) map.get( "n_title"));
			NewsIdx[i] = String.valueOf((Integer)map.get( "n_id"));	
	}
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>測試首頁</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body>
    <div id="container">
        <header>
        	<div class="logo"><img src="images/logo.png" width="70" height="48" alt="測試首頁" border="0"></div>
            <div class="company">測試首頁</div>
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
       
        <article>
        <aside class="aside-left-1">
            <div class="news-img">
                <img src="img/news.jpg" width="252" height="260" border="0">
            </div>
            <div class="news-content">
                <div class="title-1">
                	<a href="news_list.jsp?page=1" target="_self" >最新消息</a>
                </div>
                <ul class="news-list first">
                <%for(int i=0;i<NewsArray.length;i++){%>
                    <li class="list-a"><span class="list-style-1"></span><a href="news_content.jsp?id=<%=NewsIdx[i]%>" target="_self" title="<%=NewsAll[i]%>"><%=NewsArray[i]%></a></li>
                <%}%>
                </ul>
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
		$('article').css({height:$(window).height()-($('header').height()+$('nav').height()+$('#slider').height()+$('footer').height()+120)});
	}).trigger('resize');
		
})();
</script>
</body>
</html>
