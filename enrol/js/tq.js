function getRequest() {
	var url = window.location.search; // 获取url中"?"符后的字串
	var theRequest = new Object();
	if (url.indexOf("?") != -1) {
		var str = url.substr(1);
		strs = str.split("&");
		for (var i = 0; i < strs.length; i++) {
			// 就是这句的问题
			theRequest[strs[i].split("=")[0]] = decodeURI(strs[i].split("=")[1]);
			// 之前用了unescape()
			// 才会出现乱码
		}
	}
	return theRequest;
}

function showLayer() {
	// console.log(getRequest());
	var category_id = getRequest().category_id;
	if (category_id != null) {
		$("#share,#app-fx").show();
	}
	if (category_id == null) {
		$("#footer,#luody").show();
	}
}

var ua = navigator.userAgent.toLowerCase();
function device() {
	if (/iphone|ipad|ipod/.test(ua)) {
		return "iOS";
	}
	if (/android/.test(ua)) {
		return "android";
	}
	return null;
}

// 'CD':执业药师类 ,'ACCO'会计师,CPA:注册会计师,GSE:考研 HR:人力资源 MD:医师医护类 PSYC:心理咨询 TQ:教师资格证
var appKeyData = {
	'CD' : "执业药师",
	'ACCO' : "会计师",
	"CPA" : "注册会计师",
	"GSE" : "考研",
	"HR" : "人力资源",
	"MD" : "医师医护",
	"PSYC" : "心理咨询",
	"TQ" : "教师资格证"
};
function voteShare(type, appKey) {
	var host = "http://" + window.location.host;
	var sinaIconUrl = host + "/images/sina_icon.png?r=" + Math.random();
	var iconUrl = host + "/images/app_icon_" + appKey + ".png?r="
			+ Math.random();
	var url = window.location.href;
	url = url.split("?")[0];
	var vote_title = "2017年教师资格证考试报名时间";
	var vote_subtitle = "2017年教师资格证考试报名细则";
	var arr = [ "wechat", "wcircle", "qq", "qzone", "blog" ];// 安卓
	var link = url;
	// console.log(host);
	var msg = "{shareId:\"0\",showTitle:\"" + vote_title + "\""
			+ ",showSubtitle:\"" + vote_subtitle + "\"" + ",iconUrl:\""
			+ iconUrl + "\"" + ",sinaIconUrl:\"" + sinaIconUrl + "\"}";
	// console.log(msg);
	// {vote_title:"我离毙考题奖学金，就差你一票了",vote_subtitle:"既能学习又能赚钱，毙考题助你走上人生巅峰。",iconUrl:"http://localhost:8080/images/app_icon.png?r=76",sinaIconUrl:"http://localhost:8080/images/sina_icon.png?r=76"}
	var data = {
		type : type// 类型 1是微信 2是朋友圈 3qq 4qq空间 5微博
		,
		msg : {
			vote_title : vote_title// 主标题
			,
			vote_subtitle : vote_subtitle// 副标题
			,
			iconUrl : iconUrl// 图标
			,
			sinaIconUrl : sinaIconUrl
		// 新浪图标
		},
		link : link
	// 分享链接
	}
	data = JSON.stringify(data);
	if (device() == "iOS") {
		try {
			window.webkit.messageHandlers.vote_share.postMessage(data);
		} catch (e) {
			console.log(e);
		}
	} else if (device() == "android") {
		try {
			android.vote_share(arr[type - 1], msg, link);
		} catch (e) {
			console.log(e);
		}
	}
}
$(document).ready(function(){
    //返回顶部
        $('.backtop').click(function() {
            $("html,body").animate({
                scrollTop : 0
            }, 200);
        });

    // 下载按钮关闭
   $("#close").click(function(){
     $("footer").hide();
   });
   // 查看链接锚点显示
   $(".view").each(function(i){
     $(this).click(function(){
      $(".huod").css("padding","0");
      switch(i){
        case 9:
            $(".ggao>div").hide();
            $("#ln").show();
            break;
        case 12:
            $(".ggao>div").hide();
            $("#sd").show();
            break;
        case 14:
            $(".ggao>div").hide();
            $("#sx").show();
            break;
        case 24:
            $(".ggao>div").hide();
            $("#sh").show();
            break;
        case 28:
            $(".ggao>div").hide();
            $("#hn").show();
            break;
        default:
            $(".ggao>div").hide();
            $("#china").show();
        break;
       }
        $("#backtop").show();
     })
  })
})