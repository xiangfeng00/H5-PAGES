<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge chrome=1">
<meta name = "format-detection" content = "telephone=no">
<title>心理咨询</title>
<link rel="stylesheet" href="/frontEnd/psy-shaicj/css/bootstrap.min.css">
<link rel="stylesheet" href="/frontEnd/psy-shaicj/css/style.css">
</head>

<body>
	<div class="mask"></div>
	<!--遮罩层-->
	<section class="container p0 tc">
		<div>
			<img src="/frontEnd/psy-shaicj/images/showscore_02.jpg" alt="" class="img-responsive w100">
		</div>
		<a href="javascript:;" onClick="explain()" class="exp"></a>
		<div class="explain">
			<a href="javascript:;" class="close" onClick="close()"></a> <img src="/frontEnd/psy-shaicj/images/img_03.jpg" alt="" class="img-responsive" style="width: 100%; padding: 1px">
			<div>
				<p>
					<strong>一、活动时间</strong>
				</p>
				<p class="ti">2017年8月4日--2017年9月10日</p>
				<p>
					<strong>二、参与对象</strong>
				</p>
				<p class="ti">凡是参加2017年5月心理咨询师考试的考生皆可参加本次晒成绩活动。</p>
				<p>
					<strong>三、活动奖品</strong>
				</p>
				<p style="color: #DD1554; text-indent: 24px;">(以下奖品仅取最高一份奖励)</p>
				<p class="ti">1. 两科成绩≥60分 且前三名的同学，可得一份神秘礼包（到底是什么呢？猜猜猜）;</p>
				<p class="ti">2. 两科成绩≥60分，可得超级大礼包一份(老毙保证绝对不是学金币);</p>
				<p class="ti">3. 单科成绩≥60分，可获得399学金币;</p>
				<p>
					<strong>四、活动规则</strong>
				</p>
				<p class="ti">1. 填写成绩表单→生成成绩单→分享到朋友圈→把【分享后的截图】发到微信公众号（Bikaoti），回复：“晒成绩”，即可参与活动;</p>
				<p class="ti">2. 为保证公平性，学员填写的信息、成绩必须真实，否则视为弃权;</p>
				<p class="ti">3.参加晒成绩活动，即可获得一次领奖机会不可重复晒分;</p>
				<p class="ti">4.奖品发放时间：在活动结束后30个工作日陆续发放;</p>
				<p class="ti">5.活动最终解释权归毙考题所有。</p>
			</div>
		</div>
		<div class="container">
			<form class="mainForm mainForm1 row">
				<div class="note tc">2017年5月心理咨询师考试成绩已经公布了!闭关苦练那么久得到的成绩,必须要把这个成果与大家分享分享!</div>
				<div class="col-xs-12 normalInput">
					<!-- 表格 -->
					<input class="user" maxlength="6" id="name" placeholder="请输入您的姓名" type="text">
				</div>
				<div class="col-xs-12 normalInput">
					<input class="zkz" maxlength="30" id="zkz" placeholder="请输入您的准考证" type="text">
				</div>
				<div class="col-xs-12 normalInput">
					<input class="qq" maxlength="20" id="qq" placeholder="请输入您的QQ" type="text">
				</div>
				<div class="col-xs-12 normalInput">
					<!--地区选择 -->
					<div class="demo">
						<div id="trigger1">
							请选择您的地区：<span style="color: #333"></span>
						</div>
						<em class="tri"></em>
					</div>
				</div>
				<div class="col-xs-12 normalInput">
					<!--考试类别 -->
					<div class="demo">
						<div id="trigger2">
							请选择考试类别：<span style="color: #333"></span>
						</div>
						<em class="tri"></em>
					</div>
				</div>
				<div class="col-xs-12 p0">
					<div class="col-xs-6 normalInput">
						<input maxlength="3" id="lilun" placeholder="基础理论成绩" type="text">
					</div>
					<div class="col-xs-6 normalInput">
						<input maxlength="3" id="operation" placeholder="技能实操成绩" type="text">
					</div>
				</div>
				<span class="error" id="error"></span>
				<!--错误提示-->
				<a id="save" href="javascript:;" class="fullBtnBlue"> <strong>生成成绩单</strong>
				</a>
			</form>

		</div>
		<!-- example -->
		<div class="example">
			<div class="container p0 list">
				<p>
					<span>姓名</span><span>考试类别</span><span>理论知识</span><span>操作技能</span>
				</p>
				<div class="picMarquee-top">
					<div class="bd">
						<ul class="picList">
						<c:forEach var="obj" items="${list}" varStatus="i">
							<li><i>${obj.user_name}</i><i>${obj.category_name}</i><i>${obj.tk_achievement}</i><i>${obj.os_achievement}</i></li>
						</c:forEach>
						</ul>
						<a href="javascript:;" class="f16" id="more">查看更多>></a>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<script src="/frontEnd/psy-shaicj/js/jquery-1.8.3.min.js"></script>
<!-- 地区/考试类别 -->
<script src="/frontEnd/psy-shaicj/js/mobileSelect.js"></script>
<script src="/frontEnd/psy-shaicj/js/select.js"></script>
<script>
	var user_id="${uid}";
	var app_key='${appKey}';
	//更多链接
	var moreLink='${moreLink}';
	
	var submitA=$('#save');
	submitA.bind("click",function(){
		save();
	});
	
	function save() {
		$("#error").html("");
		var nickname = $("#name").val();
		var zkz = $("#zkz").val();
		var qq = $("#qq").val();
		var address = $("#trigger1 span").text();
		var type = $("#trigger2 span").text();
		var lilun = $("#lilun").val();
		var operation = $("#operation").val();
		if (nickname == "") {
			$("#error").html("姓名不要为空！");
			return false;
		}
		if (zkz == "") {
			$("#error").html("请输入准考证！");
			return false;
		}
		if (qq == "") {
			$("#error").html("请输入qq！");
			return false;
		}
		if (address == "") {
			$("#error").html("请选择地址！");
			return false;
		}
		if (type == "") {
			$("#error").html("请选择考试类别！");
			return false;
		}
		if (lilun == "") {
			$("#error").html("请输入基础理论成绩！");
			return false;
		}
		if(isNaN(lilun)){
			$("#error").html("请输入正确的基础理论成绩！");
			return false;
		}
		if (operation == "") {
			$("#error").html("请输入技能实操成绩！");
			return false;
		}
		if (isNaN(operation)){
			$("#error").html("请输入正确的技能实操成绩！");
			return false;
		}
		
		if (parseInt(lilun,10)>100) {
			$("#error").html("同学，基础理论成绩总分也就100分~");
			return false;
		}
		if( parseInt(operation,10)>100){
			$("#error").html("同学，技能实操成绩总分也就100分~");
			return false;
		}
		
		submitA.unbind('click');
		submitA.html('生成中..');
		$("#error").html("");
		
		var reqParam={
				"user_name":nickname,
				"uid":user_id,
				"appKey":app_key,
				"admission_card":zkz,
				"province_name":address,
				"category_name":type,
				"tk_achievement":lilun,
				"os_achievement":operation,
				"qq":qq
		};
		
		$.ajax({
            type: "POST",
            url: "/activity/achi/save",
            data: reqParam,
            dataType: "json",
            success: function(data){
            	if (data.code == 1) {
 			        window.location.href=data.successRequrl;
 				}else{
 					$("#error").html("系统异常！请重试");
 				}
            	submitA.html('生成成绩单');
       			submitA.bind("click",function(){
       				save();
       			});
            },
			error:function(data){
	  			$("#error").html("系统异常！请重试");
	  			submitA.html('生成成绩单');
	  			submitA.bind("click",function(){
	  				save();
	  			});
			}
        });
		
	}
	//更多按钮事件
    $('#more').on('touchend',function(){
    	window.location.href=moreLink;
    });
</script>
</html>
