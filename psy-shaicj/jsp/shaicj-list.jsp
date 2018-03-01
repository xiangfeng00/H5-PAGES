<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no">
    <meta name = "format-detection" content = "telephone=no">
	<meta http-equiv="X-UA-Compatible" content="ie=edge chrome=1">
    <title>心理咨询</title>
    <link rel="stylesheet" href="/frontEnd/psy-shaicj/css/bootstrap.min.css">
    <link rel="stylesheet" href="/frontEnd/psy-shaicj/css/style.css">
</head>

<body>
<section class="container p0 tc">    
    <!-- example -->
  <div class="example">
      <div class="container p0 list">
        <p><span>姓名</span><span>考试类别</span><span>理论知识</span><span>操作技能</span></p>
        <div class="picMarquee-top">
          <div class="bd">
            <ul class="picList">
              <c:forEach var="obj" items="${list}" varStatus="i">
				<li><i>${obj.user_name}</i><i>${obj.category_name}</i><i>${obj.tk_achievement}</i><i>${obj.os_achievement}</i></li>
			</c:forEach>			
            </ul>
          </div>
        </div>
    </div>
  </div>
</section>
</body>
</html>
