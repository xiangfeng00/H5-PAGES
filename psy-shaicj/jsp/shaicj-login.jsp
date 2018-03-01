<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <div><img src="/frontEnd/psy-shaicj/images/showscore_02.jpg" alt="" class="img-responsive w100"></div>
     <a href="javascript:;" onClick="explain()" class="exp"></a>
     <div class="explain">
             <a href="javascript:;" class="close" onClick="close()"></a>
             <img src="/frontEnd/psy-shaicj/images/img_03.jpg" alt="" class="img-responsive" style="width:100%;padding:1px">
             <div>
                <p><strong>一、活动时间</strong></p>
                <p class="ti">2017年8月4日--2017年9月10日</p>
                <p><strong>二、参与对象</strong></p>
                <p class="ti">凡是参加2017年5月心理咨询师考试的考生皆可参加本次晒成绩活动。</p>
                <p><strong>三、活动奖品</strong></p>
                <p style="color:#DD1554;text-indent:24px;">(以下奖品仅取最高一份奖励)</p>
             	  <p class="ti">1. 两科成绩≥60分 且前三名的同学，可得一份神秘礼包（到底是什么呢？猜猜猜）;</p>
             	  <p class="ti">2. 两科成绩≥60分，可得超级大礼包一份(老毙保证绝对不是学金币);</p>
             	  <p class="ti">3. 单科成绩≥60分，可获得399学金币;</p>
                <p><strong>四、活动规则</strong></p>
                <p class="ti">1. 填写成绩表单→生成成绩单→保存截图→分享到朋友圈→把【分享后的截图】发到微信公众号（Bikaoti），回复：“晒成绩”，即可参与活动;</p>
                 <p class="ti">2. 为保证公平性，学员填写的信息、成绩必须真实，否则视为弃权;</p>
                 <p class="ti">3.参加晒成绩活动，即可获得一次领奖机会不可重复晒分;</p>
                 <p class="ti">4.奖品发放时间：在活动结束后30个工作日陆续发放;</p>
                 <p class="ti">5.活动最终解释权归毙考题所有。</p>
             </div>
     </div>
    <div class="container" style="background-color: #faf4e6;">
        <div class="login">
        	<a href="javascript:;" class="f16" id="login">登录</a>
        </div>

    </div>
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
            <a href="javascript:;" class="f16" id="more">查看更多>></a>
          </div>
        </div>
    </div>
  </div>
</section>
<script src="/frontEnd/psy-shaicj/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	//更多链接
	var moreLink='${moreLink}';
	

    var ua = navigator.userAgent.toLowerCase();
   //登录按钮事件 
    $('#login').on('touchend',function(){
    	copyToClipboard();
    });
  //更多按钮事件
    $('#more').on('touchend',function(){
    	window.location.href=moreLink;
    });
    
    //登录
    function copyToClipboard() {
        if (/iphone|ipad|ipod/.test(ua)) {
            try {
                window.webkit.messageHandlers.login.postMessage(0);
            } catch (e) {
                console.log(e);
            }
        } else if (/android/.test(ua)) {
            try {
                android.login(0);
            } catch (e) {
                console.log(e);
            }
        }
    }

    function device() {
        if (/iphone|ipad|ipod/.test(ua)) {
            return "iOS";
        }
        if (/android/.test(ua)) {
            return "android";
        }
        return null;
    }
    
    function explain() {//说明
  	  showBtn();
  		var swidth = window.screen.width - 280; //按分辨率居中
  		$(".explain").css('margin-left', swidth / 2 + 'px');
  		$(".close").click(function() {
  			hideBtn();
  		})
  	};
  	function showBtn() { //显示
  		$(".mask").show();
  		$(".explain").show();//图形验证码弹出框
  	}
  	function hideBtn() {
  		$(".mask").hide(); //隐藏
  		$(".explain").hide()
  	}	

</script>
</body>
</html>
