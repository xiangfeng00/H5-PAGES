<%--
  Created by IntelliJ IDEA.
  User: wei
  Date: 2017/8/7
  Time: 下午1:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>获取</title>
    <style>
        table {
            padding: 20px 5px;
            padding-top: 10px;
            text-align: justify;
            width: 90%;
            border-collapse: collapse;
        }

        table img {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            margin-top: 10px;
            margin-right: 10px;
        }

        table tr {
            padding-top: 10px;
        }

        tr, td, th {
            border: 1px solid #d1d1d1;
        }

        table td {
            word-wrap: break-word !important;
        }

        .btn {
            border-radius: 4px;
            display: inline-block;
            *display: inline;
            /* IE7 inline-block hack */

            *zoom: 1;
            padding: 4px 14px;
            margin-bottom: 0;
            font-size: 14px;
            line-height: 20px;
            *line-height: 20px;
            text-align: center;
            vertical-align: middle;
            cursor: pointer;
            color: #333333;
            text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
            background-color: #f5f5f5;
            background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6);
            background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6));
            background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6);
            background-image: -o-linear-gradient(top, #ffffff, #e6e6e6);
            background-image: linear-gradient(to bottom, #ffffff, #e6e6e6);
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffffff', endColorstr='#ffe6e6e6', GradientType=0);
            border-color: #e6e6e6 #e6e6e6 #bfbfbf;
            border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
            *background-color: #e6e6e6;
            /* Darken IE7 buttons by default so they stand out more given they won't have borders */

            filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
            border: 1px solid #bbbbbb;
            *border: 0;
            border-bottom-color: #a2a2a2;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
            *margin-left: .3em;
            -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
            -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
            box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
        }

        .title {
            margin: 10px auto;
        }

        .table {
            max-height: 400px;
            overflow: scroll;
        }

        .box {
            margin: 10px;
        }
        .boxBody{
            padding-bottom: 120px;
        }
    </style>
</head>
<body>
<div class="boxBody">
    <div class="box">
        <p>考点</p>
        <form action="javascript:void(0);" id="myForm">
            <div class="title">
                <p>
                    密码:<input id="password" name="password" placeholder="密码"/>
                    账号:<input id="account" name="account" placeholder="账号"/>
                    旧的时间:<input id="oldTime" name="oldTime" placeholder="旧的时间"/>
                    新的时间:<input id="newTime" name="newTime" placeholder="新的时间"/>
                    最大转换条数:<input name="len" placeholder="最大转换条数"/>
                    状态：
                    <select name="status">
                        <option value="0">未掌握</option>
                        <option value="1">基本掌握</option>
                        <option value="2">已经掌握</option>
                    </select>
                    <input id="type" type="hidden" name="type" value="1"/>
                    <input id="isUpdate" type="hidden" name="isUpdate" value="0"/>
                </p>
                <p>
                    <button class="btn" onclick="show(1)">替换</button>
                    <button class="btn" onclick="show(0)">查询</button>
                </p>
            </div>
        </form>
        <p>考点列表</p>
        <table>
            <tr>
                <th width="33%">时间</th>
                <th width="33%">考点数</th>
                <th width="33%">类目名字</th>
            </tr>
        </table>
        <div class="table">
            <table id="testCenter">

            </table>
        </div>
    </div>
    <div class="box">
        <p>题目</p>
        <form action="javascript:void(0);" id="myForm1">
            <div class="title">
                <p>
                    密码:<input name="password" placeholder="密码"/>
                    账号:<input name="account" placeholder="账号"/>
                    旧的时间:<input name="oldTime" placeholder="旧的时间"/>
                    新的时间:<input name="newTime" placeholder="新的时间"/>
                    最大转换条数:<input name="len" placeholder="最大转换条数"/>
                    <input type="hidden" name="type" value="2"/>
                    <input type="hidden" id="isUpdate1" name="isUpdate" value="0"/>
                </p>
                <p>
                    <button class="btn" onclick="show2(1)">替换</button>
                    <button class="btn" onclick="show2(0)">查询</button>
                </p>
            </div>
        </form>
        <p>试卷列表</p>
        <table>
            <tr>
                <th width="33%">时间</th>
                <th width="33%">试卷数</th>
                <th width="33%">类目名字</th>
            </tr>
        </table>
        <div class="table">
            <table id="testPaper">

            </table>
        </div>
    </div>
    <div class="box">
        <p>章节练习、智能练习</p>
        <form action="javascript:void(0);" id="myForm2">
            <div class="title">
                <p>
                    密码:<input name="password" placeholder="密码"/>
                    账号:<input name="account" placeholder="账号"/>
                    旧的时间:<input name="oldTime" placeholder="旧的时间"/>
                    新的时间:<input name="newTime" placeholder="新的时间"/>
                    最大转换条数:<input name="len" placeholder="最大转换条数"/>
                    状态：
                    <select name="status">
                        <option value="0">智能练习</option>
                        <option value="1">章节练习</option>
                    </select>
                    <input type="hidden" name="type" value="3"/>
                    <input type="hidden" id="isUpdate2" name="isUpdate" value="0"/>
                </p>
                <p>
                    <button class="btn" onclick="show3(1)">替换</button>
                    <button class="btn" onclick="show3(0)">查询</button>
                </p>
            </div>
        </form>
        <p>列表</p>
        <table>
            <tr>
                <th width="33%">时间</th>
                <th width="33%">数据数</th>
                <th width="33%">类目名字</th>
            </tr>
        </table>
        <div class="table">
            <table id="testPaper1">

            </table>
        </div>
    </div>
    <div class="box">
        <p>题目</p>
        <form action="javascript:void(0);" id="myForm3">
            <div class="title">
                <p>
                    密码:<input name="password" placeholder="密码"/>
                    账号:<input name="account" placeholder="账号"/>
                    旧的时间:<input name="oldTime" placeholder="旧的时间"/>
                    新的时间:<input name="newTime" placeholder="新的时间"/>
                    最大转换条数:<input name="len" placeholder="最大转换条数"/>
                    状态：
                    <select name="status">
                        <option value="1">正确</option>
                        <option value="0">错误</option>
                    </select>
                    <input type="hidden" name="type" value="4"/>
                    <input type="hidden" id="isUpdate3" name="isUpdate" value="0"/>
                </p>
                <p>
                    <button class="btn" onclick="show4(1)">替换</button>
                    <button class="btn" onclick="show4(0)">查询</button>
                </p>
            </div>
        </form>
        <p>题目列表</p>
        <table>
            <tr>
                <th width="33%">时间</th>
                <th width="33%">数据数</th>
                <th width="33%">类目名字</th>
            </tr>
        </table>
        <div class="table">
            <table id="testPaper2">

            </table>
        </div>
    </div>

    <div class="box">
        <p>删除上周的周报</p>
        <form action="javascript:void(0);" id="myForm4">
            <div class="title">
                <p>
                    密码:<input name="password" placeholder="密码"/>
                    <input type="hidden" name="type" value="5"/>
                </p>
                <p>
                    <button class="btn" onclick="del()">删除</button>
                </p>
            </div>
        </form>
        <p id="showErr">

        </p>
    </div>
</div>
<script src="/js/jquery.1.9.1min.js"></script>
<script>
    function del() {
        var data = $("#myForm4").serializeArray();
        $("#showErr").html("");
        $.post("/api/user/report/testReport", data, function (data) {
            if (data.code == 0) {
                $("#showErr").html("删除ok")
            } else {
                alert(data.msg);
            }
        });
    }
    function show(isUpdate) {
        $("#isUpdate").val(isUpdate);
        var data = $("#myForm").serializeArray();
        $("#testCenter").html("");
        $.post("/api/user/report/testReport", data, function (data) {
            if (data.code == 0) {
                console.log(data);
                var arr = data.data;
                var len = arr.length;
                for (var i = 0; i < len; i++) {
                    var temp = arr[i];
                    $("#testCenter").append(
                        "<tr>" +
                        "<td width='33%'>" + temp.days + "</td>" +
                        "<td width='33%'>" + temp.count + "</td>" +
                        "<td width='33%'>" + temp.name + "</td>" +
                        "</tr>");
                }

            } else {
                alert(data.msg);
            }
        });
    }
    function show2(isUpdate) {
        $("#isUpdate1").val(isUpdate);
        var data = $("#myForm1").serializeArray();
        $("#testPaper").html("");
        $.post("/api/user/report/testReport", data, function (data) {
            if (data.code == 0) {
                var arr = data.data;
                var len = arr.length;
                for (var i = 0; i < len; i++) {
                    var temp = arr[i];
                    if (temp.days != null) {
                        $("#testPaper").append(
                            "<tr>" +
                            "<td width='33%'>" + temp.days + "</td>" +
                            "<td width='33%'>" + temp.count + "</td>" +
                            "<td width='33%'>" + temp.name + "</td>" +
                            "</tr>");
                    }
                }

            } else {
                alert(data.msg);
            }
        });
    }
    function show3(isUpdate) {
        $("#isUpdate2").val(isUpdate);
        var data = $("#myForm2").serializeArray();
        $("#testPaper1").html("");
        $.post("/api/user/report/testReport", data, function (data) {
            if (data.code == 0) {
                var arr = data.data;
                var len = arr.length;
                for (var i = 0; i < len; i++) {
                    var temp = arr[i];
                    if (temp.days != null) {
                        $("#testPaper1").append(
                            "<tr>" +
                            "<td width='33%'>" + temp.days + "</td>" +
                            "<td width='33%'>" + temp.count + "</td>" +
                            "<td width='33%'>" + temp.name + "</td>" +
                            "</tr>");
                    }
                }

            } else {
                alert(data.msg);
            }
        });
    }
    function show4(isUpdate) {
        $("#isUpdate3").val(isUpdate);
        var data = $("#myForm3").serializeArray();
        $("#testPaper2").html("");
        $.post("/api/user/report/testReport", data, function (data) {
            if (data.code == 0) {
                var arr = data.data;
                var len = arr.length;
                for (var i = 0; i < len; i++) {
                    var temp = arr[i];
                    if (temp.days != null) {
                        $("#testPaper2").append(
                            "<tr>" +
                            "<td width='33%'>" + temp.days + "</td>" +
                            "<td width='33%'>" + temp.count + "</td>" +
                            "<td width='33%'>" + temp.name + "</td>" +
                            "</tr>");
                    }
                }

            } else {
                alert(data.msg);
            }
        });
    }
</script>
</body>
</html>