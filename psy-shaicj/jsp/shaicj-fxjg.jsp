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
    <style type="text/css">
    
/*share*/
.fenx { padding: 0 15px;position: fixed;bottom: 0;z-index: 999; background-color:#fff;}
.fenx_xian{text-align:center; color:#b0adad;display: inline-block;line-height: 4rem; width: 100%;border-top:1px solid #efefef;line-height:0px}
.fenx_xian span {padding: 0 10px; background-color: #fff;}
.share-text{margin: 0 30px 10px 30px;}
.share-text h4{font-size:20px}
.share-text h5{color:#b0adad;font-size:16px}
.share-icon{width:100%;margin: 0px auto;display: inline-block; padding: 5px 0 5px;}
.share-icon .row{margin:0;}
.col-xs-2 {width: 20%;}
.share-icon .col-xs-3, .share-icon .col-xs-3{padding:0;margin: auto;vertical-align: middle}
.share-icon .col-xs-3 img{width: 54%;margin-top: 0px;}
.share-icon .col-xs-3  a{cursor: pointer;display: block;}
.share-icon .col-xs-3 img{width: 60%;margin-top: 5px;}
@media (min-width:992px){.share-icon .col-xs-3{line-height: 8rem;font-size: 16px;}}
    </style>
</head>

<body>
<div class="mask"></div>
<!--遮罩层-->
<section class="container p0 tc">
    <div><img src="/frontEnd/psy-shaicj/images/banner_1.jpg" alt="" class="img-responsive w100"></div>

    <div class="container" style="background-color: #faf4e6;">
    	<!--奖状-->
        <div class="jiangz">       	
            <div class="grxx">
                <p>${example.user_name}同学：</p>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;您在2017年5月${example.category_name}考试中取得了优异的成绩，在此向您表示祝贺！</p>
                <p>您的分数如下：</p>
                <p>基础理论：<i>${example.tk_achievement}</i>分 &nbsp; 技能实操： <i>${example.os_achievement}</i>分</p>
                <p>特发此证，以示嘉奖！</p>
            </div>           
        </div>
        <c:if test="${empty share}">
	        <a href="javascript:;" class="fullBtnBlue" id="share"><strong>分享我的成绩</strong></a>
	        <div style="color:#434343; text-align:left; letter-spacing:1px; padding:5px 20px 25px;">分享到朋友圈 > 把【分享后的截图】发到微信公众号(Bikaoti)  回复：“晒成绩”，即可参与活动。</div>
	   	</c:if>
	   	<c:if test="${not empty share}">
	   		        <div style="color:#434343; text-align:left; letter-spacing:1px; padding:5px 20px 25px;">&nbsp;</div>
	   	
	   	</c:if>
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
            <a href="javascript:;"  class="f16"  id="more">查看更多>></a>
          </div>
        </div>
    </div>
  </div>
</section>

<!--分享-->
	<div class="fenx fenx719" id="shareBox" style="display: none;">
		<div class="fenx_xian">
			<span>分享至</span>
		</div>
		<div class="share-icon fix">
			<div class="row  fix">
				<div class="col-xs-2">
					<a href="javascript:;" class="weixin" onclick="voteShare(1)"> <img src="/views/share/images2/icon_wechat.svg" class="img-responsive" alt="" />
					</a>
				</div>
				<div class="col-xs-2">
					<a href="javascript:;" class="weixinquan" onclick="voteShare(2)"> <img src="/views/share/images2/icon_fas.svg" class="img-responsive" alt="" />
					</a>
				</div>
				<div class="col-xs-2">
					<a href="javascript:;" class="qq" onclick="voteShare(3)"> <img src="/views/share/images2/icon_qq.svg" class="img-responsive" alt="" />
					</a>
				</div>
				<div class="col-xs-2">
					<a href="javascript:;" class="zone" onclick="voteShare(4)"> <img src="/views/share/images2/icon_qqzone.svg" class="img-responsive" alt="" />
					</a>
				</div>
				<div class="col-xs-2">
					<a href="javascript:;" class="sina" onclick="voteShare(5)"> <img src="/views/share/images2/icon_xinlan.svg" class="img-responsive" alt="" />
					</a>
				</div>
			</div>
		</div>
	</div>
  <c:if test="${not empty share}">
<!--app下载条--> 
<footer class="mui-bar mui-bar-footer " id="footer">
    <div class="mui-row">
        <div class="col-xs-1 logo"></div>
        <div class="col-xs-4 wz">
            <h4 class="f16">毙考题 </h4>
            <h7 class="f10">专为考试定制</h7>
        </div>
        <div class="col-xs-4">
            <a href="javascript:;" onclick="downloadApp()" class="download" id="footerDownload">马上下载</a>
        </div>
        <div class="col-xs-1 mui-text-right" style="margin-top: 22px;">
            <a href="javascript:;" id="close" onclick="document.getElementById('footer').style.display='none'">×</a>
        </div>
    </div>
</footer>
</c:if>
</body>
<script src="/frontEnd/psy-shaicj/js/jquery-1.8.3.min.js"></script>
<!-- 一般逻辑 -->
<script>
	//更多链接
	var moreLink="${moreLink}";
	  
    var index = 1;
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
        if (operation == "") {
            $("#error").html("请输入技能实操成绩！");
            return false;
        }
        if (index != 1) {
            return false;
        }
        index++;
    }
  	//更多按钮事件
    $('#more').on('touchend',function(){
    	//落地页，去下载
    	if("${share}"){
    		downloadApp();
    		return;
    	}
    	window.location.href=moreLink;
    });
  	$('#share').on('touchend',function(){
  		var shareBox=$("#shareBox");
  		var status=shareBox.css('display');
  		if(status=='block'){
  			shareBox.css('display','none')
  		}else{
  			shareBox.css('display','block')
  		}
  		
    });
  	
  	</script>
  	<!-- 分享的逻辑 -->
  	<script type="text/javascript">
    var rr = Math.random();
    var index_child = "http://bkt.jeagine.com";
    var vote_title = "老铁们，是时候秀一波成绩啦！";
    var iconUrl = index_child + "/images/app_icon.png?r=" + rr;
    var sinaIconUrl = index_child + "/images/sina_icon.png?r=" + rr;
    var vote_subtitle = "快来围观我的成绩吧！";

	 function voteShare(type) {
	        var arr = ["wechat", "wcircle", "qq", "qzone", "blog"];//安卓
	        var msg = "{shareId:\"0\",showTitle:\"" + vote_title + "\"" +
	            ",showSubtitle:\"" + vote_subtitle + "\"" +
	            ",iconUrl:\"" + iconUrl + "\"" +
	            ",sinaIconUrl:\"" + sinaIconUrl + "\"}";
	         //分享链接
	        var link = "${shareLink}";    
	        var data = {
	            type: type//类型 1是微信 2是朋友圈 3qq 4qq空间 5微博
	            , msg: {
	                vote_title: vote_title//主标题
	                , vote_subtitle: vote_subtitle//副标题
	                , iconUrl: iconUrl//图标
	                , sinaIconUrl: sinaIconUrl//新浪图标
	            }
	            , link: link//分享链接
	        }
	        data = JSON.stringify(data);
	        if (device == "iOS") {
	            try {
	                window.webkit.messageHandlers.vote_share.postMessage(data);
	            } catch (e) {
	                console.log(e);
	            }
	        } else if (device == "android") {
	            try {
	                android.vote_share(arr[type - 1], msg, link);
	            } catch (e) {
	                console.log(e);
	            }
	        }
	    }
		var ua = navigator.userAgent.toLowerCase();
		//分享
		var device = device();
		if (device == "iOS") {
			try {
				window.webkit.messageHandlers.vote_share.postMessage(data);
			} catch (e) {
				console.log(e);
			}
		} else if (device == "android") {
			try {
				android.vote_share(arr[type - 1], msg, link);
			} catch (e) {
				console.log(e);
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
	    var ua = navigator.userAgent.toLowerCase();
	    function downloadApp() {
	        if (/iphone|ipad|ipod/.test(ua)) {
	            window.open("https://itunes.apple.com/us/app/bi-kao-ti/id1250277736?l=zh&ls=1&mt=8");
	        } else if (/android/.test(ua)) {
	            window.open("http://a.app.qq.com/o/simple.jsp?pkgname=com.jeagine.psy");
	        }
	    }
	</script>
</html>
