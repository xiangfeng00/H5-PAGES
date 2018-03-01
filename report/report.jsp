<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学习报告</title>
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <c:if test="${bookList!=null}">
        <link href="/frontEnd/css/report.css" rel="stylesheet"/>
    </c:if>
</head>
<body>
<c:if test="${bookList==null}">
    <p style="color: #969696;font-size: 17px;text-align: center;margin-top: 100px">暂无报告</p>
</c:if>
<c:if test="${bReportWeek!=null}">
    <div class="container">
        <!-- 标题 -->
        <div class="week f18" onclick="goToWeek()"><a href="javascript:;">学习周报&nbsp;<span>${bReportWeek.date_str}</span></a>
        </div>
    </div>
</c:if>
<!-- 模块一 -->
<c:if test="${bookList!=null}">
    <c:forEach var="bookList" items="${bookList}">
        <c:set var="bid" value="${bookList.id}"/>
        <div class="container" id="book_${bid}">
            <div class="gzsm"><i>说 明</i></div>
            <div class="box">
                <div class="top"></div>
                <div class="middle tc">
                    <h3><p>${bookList.book_name}</p></h3>
                    <!-- 通过状态 class=pass，不通过的状态class=fail 两个样式对应相应的图标-->
                    <i id="isPass_${bid}" class=""></i>
                </div>
                <div class="bottom"></div>
                <div class="content">
                    <!-- 已掌握考点 -->
                    <div class="kaod fix">
                        <div class="col-xs-12 f16" style="padding-top:0">
                            <p class="f14 gray">已掌握考点</p>
                            <div class="col-xs-10">
                                <strong class="f22 yellow" id="testMy_${bid}">0</strong>&nbsp;<span>/总<d
                                    id="testAll_${bid}">0</d></span>
                                &nbsp;&nbsp;击败<span class="yellow" id="beat_${bid}">0%</span>用户
                            </div>
                            <div class="col-xs-2"><i id="testItemIsPass_${bid}" class=""></i></div>
                        </div>
                    </div>
                    <!-- 共答题套数 -->
                    <div class="num fix">
                        <div class="col-xs-12 f16">
                            <p class="f14 gray">共答真题</p>
                            <div class="col-xs-10"><strong class="f22 yellow"
                                                           id="myPaperCount_${bid}">0</strong>&nbsp;<span>/总<d
                                    id="allPaperCount_${bid}">0</d></span>
                                &nbsp;&nbsp;正确率<span class="yellow" id="rightRate_${bid}">0%</span>
                            </div>
                            <div class="col-xs-2"><i id="testPaperIsPass_${bid}" class=""></i></div>
                        </div>
                    </div>
                    <!-- 需要巩固章节 -->
                    <div class="improve" style="display: none" id="errorCount_${bid}">
                        <p class="f14 gray">需要巩固的章节</p>
                        <ul>
                                <%--<li class="fix">--%>
                                <%--<span class="col-xs-2">第一章</span>--%>
                                <%--<span class="col-xs-10 title">依托互联网数据资源和自然语言处理技术优势，致力于帮助用户跨越语言鸿沟</span>--%>
                                <%--</li>--%>
                        </ul>
                    </div>
                </div>
                <div class="boxbottom"></div>
            </div>
        </div>
        <div><img src="/frontEnd/images/presentation_bg2.png" alt="" class="img-responsive w100"></div>
    </c:forEach>
</c:if>
<!--弹窗-->
<div class="mask"></div><!--遮罩层-->
<div class="sm-tc">
    <h2 id="txt01">说 明</h2>
    <p>1、【考点】通过规则：掌握考点数占比书本总考点数90%及以上。</p>
    <p>2、【真题】通过规则：共答真题套数占比总真题数60%，且平均正确率达90%及以上。</p>
    <p>3、【书本】通过规则：以上两点均为通过状态。</p>
    <a href="javascript:;" class="close">我知道了</a>
</div>
</body>
<script src="/js/jquery-1.8.3.min.js"></script>
<c:set var="bidTemp" value="0"/>
<c:forEach var="bookList" items="${bookList}">
    <c:set var="bidTemp" value="${bidTemp},${bookList.id}"/>
</c:forEach>
<%--pass fail--%>
<script>
    var cid = ${cid};
    var uid = ${uid};
    var threeLevel = '${threeLevel}';
    var bid = "${bidTemp}";
    var arrBook = bid.split(",");
    var bookLen = arrBook.length;
    for (var index = 0; index < bookLen; index++) {
        var bookId = arrBook[index];
        if (bookId != 0) {
            <c:if test="${bookList!=null}">
            learning(bookId);
            </c:if>
        }
    }
    function toDecimal(x) {
        var f = parseFloat(x);
        if (isNaN(f)) {
            return false;
        }
        var f = Math.round(x * 100) / 100;
        var s = f.toString();
        var rs = s.indexOf('.');
        if (rs < 0) {
            rs = s.length;
            s += '.';
        }
        while (s.length <= rs + 2) {
            s += '0';
        }
        s = s.replace(".00", "");
        return s;
    }
    function learning(bookId) {
        $.post("/api/user/report/learning", {
            cid: cid,
            uid: uid,
            threeLevel: threeLevel,
            bid: bookId
        }, function (data) {
            var myTestPaperCount = data.myTestPaperCount;
            var myGraspCount = data.myGraspCount;
            var allCount = data.allCount;
            $("#testMy_" + bookId).html(myGraspCount);
            var countTestItem = data.countTestItem;
            $("#testAll_" + bookId).html(countTestItem);
            var beat = data.lowCount / allCount * 100;
            if (beat != 0) {
                beat = toDecimal(beat);
            }
            if (allCount != 0) {
                $("#beat_" + bookId).html(beat + "%");
            }
            if (myGraspCount < countTestItem && countTestItem != 0) {
                $("#errorCount_" + bookId).show();
                var listTemp = data.myErrorList;
                var len = listTemp.length;
//                console.log("bid:"+bookId);
//                console.log(listTemp);
                if (len == 0) {
                    $("#errorCount_" + bookId).hide();
                }
                for (var i = 0; i < len; i++) {
                    $("#errorCount_" + bookId + " ul").append(' <li class="fix"> <span class="col-xs-12 title">' + listTemp[i].title + '</span> </li>');
                }
            }
//            var myTestPaperCount = data.myTestPaperCount;
            var paperCount = data.paperCount;
            var rightRate = data.rightRate;

            var testItem = countTestItem == 0 ? 0 : myGraspCount / countTestItem;//testItem>=0.9
            var testItemBool = testItem >= 0.9;//考点
            var testPaperBool = rightRate >= 0.9 && myTestPaperCount / paperCount >= 0.6 && paperCount != 0;//真题
            if (testItemBool) {
                $("#testItemIsPass_" + bookId).addClass("pass2");
            } else {
                $("#testItemIsPass_" + bookId).addClass("fail2");
            }
            if (testPaperBool) {
                $("#testPaperIsPass_" + bookId).addClass("pass2");
            } else {
                $("#testPaperIsPass_" + bookId).addClass("fail2");
            }
            if (testItemBool && testPaperBool) {
                $("#isPass_" + bookId).addClass("pass");
            } else {
                $("#isPass_" + bookId).addClass("fail");
            }


            $("#myPaperCount_" + bookId).html(myTestPaperCount);
            $("#allPaperCount_" + bookId).html(paperCount);
            $("#rightRate_" + bookId).html(toDecimal(rightRate * 100) + "%");

        });
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
    $(function () {
        /**
         * 安卓的分享展示或者不展示
         */
        if (device() == "iOS") {
            try {
                window.webkit.messageHandlers.setShareButton.postMessage(false);
            } catch (e) {
                console.log(e);
            }
        } else if (device() == "android") {
            try {
                android.setShareButton(false);
            } catch (e) {
                console.log(e);
            }
        }
    });
    function goToWeek() {
        var host = "http://" + window.location.host;
        var appKey = '${appKey}';
        var dateStr = '${bReportWeek.date_str}';
        if (device() == "iOS") {
            appKey = encodeURI(appKey);
            dateStr = encodeURI(dateStr);
        }
        var url = host + "/frontEnd/report/weekly.html?appKey=" + appKey
            + "&dateStr=" + dateStr
            + "&id=${bReportWeek.id}&r=" + Math.random();
        console.log(url);
        if (device() == "iOS") {
            try {
                window.webkit.messageHandlers.weekReport.postMessage(url);
            } catch (e) {
                console.log(e);
            }
        } else if (device() == "android") {
            try {
                android.weekReport(url);
            } catch (e) {
                console.log(e);
            }
        }
    }
</script>
<script>
    //弹窗
    $(document).ready(function () {
        $(".gzsm i").click(function () {
            $(".sm-tc").fadeIn();
            $(".mask").fadeIn();
        });
        $(".close").click(function () {
            $(".sm-tc").hide();
            $(".mask").hide();
        });
    });
</script>
</html>
