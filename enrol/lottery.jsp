<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>感恩大回馈，现金好礼送不停</title>
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <link href="/frontEnd/enrol/css/app.css" rel="stylesheet"/>
    <link href="/frontEnd/enrol/css/lottery.css" rel="stylesheet"/>
</head>
<body>
<!--主体-->
<div class="mask"></div><!-- 遮罩层 -->
<div class="banner">
    <div><img src="/frontEnd/enrol/images/banner_02.jpg" alt="" class="img-responsive w100"/></div>
    <div class="currentcoin tc"><span>当前学金币：<i id="gold">${gold}</i></span><span>可免费抽奖次数：<b id="frequency">${surplus}</b></span>
    </div>
</div>
<!--lottery-->
<div class="lottery">
    <div class="container">
        <div id="prize">
            <div class="row fix">
                <div class="col-xs-4">
                    <li class="" title="点击抽奖">
                        <p>小主</p>
                        <p>快来翻我啊</p>
                    </li>
                </div>
                <div class="col-xs-4">
                    <li class="" title="点击抽奖">
                        <p>我才是</p>
                        <p>大奖</p>
                    </li>
                </div>
                <div class="col-xs-4">
                    <li class="" title="点击抽奖">
                        <p>翻我</p>
                        <p>翻我来翻我</p>
                    </li>
                </div>
                <div class="col-xs-4">
                    <li class="" title="点击抽奖">
                        <p>我真的是</p>
                        <p>大奖</p>
                    </li>
                </div>
                <div class="col-xs-4">
                    <li class="" title="点击抽奖">
                        <p>不信？</p>
                        <p>你来试试</p>
                    </li>
                </div>
                <div class="col-xs-4">
                    <li class="" title="点击抽奖">
                        <p>错过我</p>
                        <p>毁终身</p>
                    </li>
                </div>
                <div class="col-xs-4">
                    <li class="" title="点击抽奖">
                        <p>别翻我</p>
                        <p>我是一个白板</p>
                    </li>
                </div>
                <div class="col-xs-4">
                    <li class="" title="点击抽奖">
                        <p>再试试</p>
                        <p>大奖就在眼前</p>
                    </li>
                </div>
                <div class="col-xs-4">
                    <li class="" title="点击抽奖">
                        <p>呵呵</p>
                        <p>逗你玩呢</p>
                    </li>
                </div>
            </div>
        </div>
        <div class="row fix tc">
            <div class="col-xs-6"><a href="javascript:;" onClick="myPrize()">我的奖品</a></div>
            <div class="col-xs-6">
                <a href="javascript:;" id="repeat">再抽一次</a>
            </div>
            <div class="col-xs-6"><a href="javascript:;" id="buygold">购买学金币</a></div>
            <div class="col-xs-6"><a href="javascript:;" class="share_lottery">分享免费抽</a></div>
        </div>
        <!--弹窗-没中奖品-->
        <div class="noprize" style="display:none;">
            <h2>感谢您的参与！</h2>
            <span>再动动手指翻大奖吧</span>
            <p><a href="javascript:;" id="repeat2" class="again">再抽一次</a></p>
            <p><a href="javascript:;" class="close" onClick="close()"></a></p>
        </div>
        <!--弹窗-抽中奖品-->
        <div id="viewother" style="display:none;">
            <h2></h2>
            <span>${user.nick_name}</span>
            <p></p>
        </div>
        <!--弹窗-我的奖品-->
        <div class="wdjp"  style="display:none;">
            <h2>我的奖品</h2>
            <span>${user.nick_name}</span>
            <div class="wdjp-list" id="wdjp">
                <ul>
                    <%--<li><i></i>--%>
                    <%--<p>感恩大礼包</p><span>1份</span></li>--%>
                    <%--<li><i></i>--%>
                    <%--<p>现金红包20元</p><span>1份</span></li>--%>
                    <%--<li><i></i>--%>
                    <%--<p>感恩大礼包</p><span>1份</span></li>--%>
                    <%--<li><i></i>--%>
                    <%--<p>现金红包20元</p><span>1份</span></li>--%>
                </ul>
            </div>
            <h3>添加毙考题官方微信(ymxs990)领取现金红包</h3>
            <a href="javascript:;" class="close" onClick="close()"></a>
        </div>
        <!--弹窗-充值学金币-->
        <div class="czxjb">
            <h2>学金币不足啦！</h2>
            <span>充值后再来找我玩吧</span>
            <p>请前往"<em>我的-我的账户</em>"栏目充值</p>
            <a href="javascript:;" class="close"></a>
        </div>
        <!--弹窗-购买学金币-->
        <div class="buycoin">
            <h2>现在充值学金币</h2>
            <span>更多大奖等你来拿！</span>
            <p>请前往"<em>我的-我的账户</em>"栏目充值</p>
            <a href="javascript:;" class="close"></a>
        </div>
        <!--弹窗-活动过期-->
        <div class="expire" id="expire1">
            <h2>活动已过期</h2>
            <span>敬请期待下次活动</span>
            <p><a href="javascript:;" class="sure" id="sure">确认</a></p>
            <a href="javascript:;" class="close"></a>
        </div>
        <div class="expire" id="expire2">
            <h2>现在要使用学金币抽奖</h2>
            <span>每次将会消耗30学金币</span>
            <p><a href="javascript:;" class="sure" onclick="again()">确认</a></p>
            <a href="javascript:;" class="close"></a>
        </div>
    </div>
    <div id="data"></div>
</div>
<div class="container">
    <!-- shuoming -->
    <div class="notes">
        <h3 class="f16 tc"><span>活动说明</span></h3>
        <p class="fix"><em class="fl">1.</em><span class="fr">首次进入活动页面即可获得一次免费抽奖机会。</span></p>
        <p class="fix"><em class="fl">2.</em><span class="fr">每位用户首次分享活动即可获得一次免费抽奖机会。</span></p>
        <p class="fix"><em class="fl">3.</em><span class="fr">免费机会使用后，若再次参加抽奖每次将会消耗30学金币。</span></p>
        <p class="fix"><em class="fl">4.</em><span class="fr">获得奖励的用户需阅读奖励获取说明，奖励最迟将在活动结束
   后三个工作日内发放。</span></p>
        <p class="fix"><em class="fl">5.</em><span class="fr">活动结束后仍未领取现金红包奖励的用户视作主动放弃奖励。</span></p>
        <p class="fix"><em class="fl">6.</em><span class="fr">新用户领取的赠送VIP与本次获得的奖励VIP时间不叠加。</span></p><br>
        <p class="tc">本次活动最终解释权归毙考题所有</p>
    </div>
</div>
<!-- share -->
<div class="fenx fenx719" id="share" style="display:none">
    <div class="fenx_xian"><span>分享至</span></div>
    <div class="share-icon fix">
        <div class="row  fix">
            <div class="col-xs-2">
                <a href="javascript:;" class="weixin" onclick="voteShare(1)">
                    <img src="/frontEnd/images/icon_wechat.svg" class="img-responsive" alt="">
                </a>
            </div>
            <div class="col-xs-2">
                <a href="javascript:;" class="weixinquan" onclick="voteShare(2)">
                    <img src="/frontEnd/images/icon_fas.svg" class="img-responsive" alt="">
                </a>
            </div>
            <div class="col-xs-2">
                <a href="javascript:;" class="qq" onclick="voteShare(3)">
                    <img src="/frontEnd/images/icon_qq.svg" class="img-responsive" alt="">
                </a>
            </div>
            <div class="col-xs-2">
                <a href="javascript:;" class="zone" onclick="voteShare(4)">
                    <img src="/frontEnd/images/icon_qqzone.svg" class="img-responsive" alt="">
                </a>
            </div>
            <div class="col-xs-2">
                <a href="javascript:;" class="sina" onclick="voteShare(5)">
                    <img src="/frontEnd/images/icon_xinlan.svg" class="img-responsive" alt="">
                </a>
            </div>
        </div>
    </div>
</div>

<script src="/js/jquery.min.js"></script>
<script type="text/javascript" src="http://www.erdangjiade.com/Public/js/other/jquery.js"></script>
<script type="text/javascript" src="/frontEnd/enrol/js/jquery-ui-1.7.2.custom.min.js"></script>
<script type="text/javascript" src="/frontEnd/enrol/js/jquery.flip.min.js"></script>
<script type="text/javascript">
    function again() {
        go(nowObject);
        $(".mask").hide();
        $("#expire2").hide();
    }
    $("#sure").click(function () {
        $(".mask").hide();
        $("#expire1").hide();
    });
    $("#buygold").click(function () {
        $(".mask").show();
        $(".buycoin").show();//购买学金币
    });
    var luckDrawCodeGet = -1;
    var categoryId = ${categoryId};
    var srcImg = "/frontEnd/enrol/images/";
    // 我的奖品
    function myPrize() {
        <c:if test="${user==null}">
        login();
        return false;
        </c:if>
        <c:if test="${user!=null}">
        $.post("/api/activity/give_list", {key: '${key}'}, function (data) {
            var list = data.list;
            $("#wdjp ul").html("");
            for(var i=0;i<list.length;i++){
                var arr ="<li><i></i><p>"+list[i].luckDrawValue+"</p><span>"+list[i].countP+"份</span></li>";
                $("#wdjp ul").append(arr);
            }
            $(".wdjp").show();
            $(".mask").show();
        });
        </c:if>
    };
    //关闭遮罩、弹窗
    $(".close").click(function () {
        if(!$(".noprize").is(":hidden")||!$("#viewother").is(":hidden")){
            $(".mask").hide();
            $(".wdjp").hide();
            $(".czxjb").hide();
            $(".buycoin").hide();
            $(".noprize").hide();
            $(".expire").hide();
        }else {
            window.location.reload();
        }

    });

    $(".share_lottery").click(function () {
        $("#share").show();//fenxiang 显示
    });
    var nowObject = [];
    $("#prize li").each(function () {
        var p = $(this);
        p.click(function () {
            <c:if test="${user==null}">
            login();
            return false;
            </c:if>
            $("#prize li").unbind('click'); //连续翻动
            var surplus = parseInt($("#frequency").text());
            var gold = parseInt($("#gold").text());
//            console.log(gold)
//            console.log(surplus)
            var teacherDraw = false;
            if(getCookie("teacherDraw")==null&&surplus == 0){
                teacherDraw = true;
                setCookie("teacherDraw","1");
            }
            if (gold < 30 && surplus == 0) {
                $(".czxjb").show();
                $(".mask").show();
            } else if (surplus == 0&&teacherDraw) {
                nowObject = p;
                $(".mask").show();
                $("#expire2").show();
            } else {
                go(p);
            }
        });
    });

    function go(p) {
        $.getJSON("/api/activity/draw_teacher", {
            key: '${key}',
            categoryId: categoryId,
            appKey: "${appKey}"
        }, function (data) {
//            console.log(data);
            $("#gold").html(data.gold);
            $("#frequency").html(data.surplusCount);
            if (data.code == 10001) {
                $("#expire1").show();
                $(".mask").show();
                return false;
            }
            if (data.code == 10002) {
                $(".czxjb").show();
                $(".mask").show();
                return false;
            }
            luckDrawCodeGet = data.luckDrawCodeGet;
            if (luckDrawCodeGet == 5) {
                $(".noprize").show();
                $(".mask").show();
            }
            var luckDrawValue = data.luckDrawValue;
            $("#viewother h2").html(luckDrawValue);
            var json = data.luckDrawData;
            var arr = ["千元红包等你来拿！这下子可以给老师送一束漂亮的花啦！","价值1400元的超级VIP免费送给你，你的学霸之路从此开始！"
                ,"学金币大派送，解锁章节妥妥的，不行还能在抽多几遍不是吗~","学金币大派送，解锁章节妥妥的，不行还能在抽多几遍不是吗~",
                " 这可不是安慰奖哟！积分代表成绩，成绩代表实力，实力能带来财富"," "];

            $("#viewother p").html(arr[luckDrawCodeGet]);
            var prize = srcImg + json.yes; //抽中的奖项
            p.flip({//开始翻转
                direction: 'rl', //翻动的方向rl：right to left
                height: '400',
                content: '<img src=' + prize + ' class="img-responsive">', //翻转后显示的内容即奖品
                speed: '200',
                color: "#00CFF9", //背景色
                onEnd: function () { //翻转结束
                    p.attr("id", "r"); //标记中奖方块的id
                    if (luckDrawCodeGet != 5) {
                        $("#viewother").fadeIn(1000); //显示查看其他按钮
                        $(".mask").show();
                    } else {
                        showData();
                        $(".mask").show();
                    }
                    $("#prize li").unbind('click').css("cursor", "default").removeAttr("title");
                }
            });
            $("#data").data("nolist", json.no); //保存未中奖信息
        });
    }

    $("#viewother").click(function () {
        <c:if test="${user==null}">
        login();
        return false;
        </c:if>
        showData();
    });

    function showData() {
        var mydata = $("#data").data("nolist"); //获取数据
        var mydata2 = eval(mydata);//通过eval()函数可以将JSON转换成数组
        $("#prize li").not($('#r')[0]).each(function (index) {
            var pr = $(this);
            pr.flip({
                direction: 'lr',
                color: "#084653",
                speed: '200',
                content: '<img src=' + srcImg + mydata2[index] + ' class="img-responsive">', //奖品信息（未抽中）
                onEnd: function () {
                    // 翻转过后的背景图
                    pr.css({
                        "background": "url(/frontEnd/enrol/images/front.png) no-repeat center",
                        "background-size": "contain"
                    });
                    if (luckDrawCodeGet != 5) {
                        $("#viewother").hide();
                        $(".mask").hide();
                    }
                }
            });
        });
        $("#data").removeData("nolist");
    }

    $("#repeat,#repeat2").click(function () {
        <c:if test="${user==null}">
        login();
        return false;
        </c:if>
        window.location.reload();
    });

    var ua = navigator.userAgent.toLowerCase();
    function voteShare(type) {
        <c:if test="${user==null}">
        login();
        return false;
        </c:if>
        <c:if test="${user!=null}">
        $.post("/api/activity/give_draw", {key: '${key}'}, function (data) {
            $("#frequency").html(data.frequency);
        });
        </c:if>
        var appKey = "${appKey}";
        var host = "http://" + window.location.host;
        var sinaIconUrl = host + "/images/sina_icon.png?r=" + Math.random();
        var iconUrl = host + "/images/app_icon_" + appKey + ".png?r=" + Math.random();
        var vote_title = "毙考题，专为考试定制的APP";
        var vote_subtitle = "只要用过，就能考过，您的专属学习管家。";
        var arr = ["wechat", "wcircle", "qq", "qzone", "blog"];// 安卓
        var link = host + "/views/share/share_register.jsp";
        // console.log(host);
        var msg = "{shareId:\"0\",showTitle:\"" + vote_title + "\""
            + ",showSubtitle:\"" + vote_subtitle + "\"" + ",iconUrl:\""
            + iconUrl + "\"" + ",sinaIconUrl:\"" + sinaIconUrl + "\"}";
        // console.log(msg);
        // {vote_title:"我离毙考题奖学金，就差你一票了",vote_subtitle:"既能学习又能赚钱，毙考题助你走上人生巅峰。",iconUrl:"http://localhost:8080/images/app_icon.png?r=76",sinaIconUrl:"http://localhost:8080/images/sina_icon.png?r=76"}
        var data = {
            type: type// 类型 1是微信 2是朋友圈 3qq 4qq空间 5微博
            ,
            msg: {
                vote_title: vote_title// 主标题
                ,
                vote_subtitle: vote_subtitle// 副标题
                ,
                iconUrl: iconUrl// 图标
                ,
                sinaIconUrl: sinaIconUrl
                // 新浪图标
            },
            link: link
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
    function device() {
        if (/iphone|ipad|ipod/.test(ua)) {
            return "iOS";
        }
        if (/android/.test(ua)) {
            return "android";
        }
        return null;
    }
    function login() {
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
    function setCookie(key,val) {
        document.cookie = key+"="+val+";path=/";
    }
    //读取cookies
    function getCookie(name) {
        var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
        if (arr = document.cookie.match(reg)) {
            return unescape(arr[2]);
        } else {
            return null;
        }
    }

</script>
</body>
</html>
