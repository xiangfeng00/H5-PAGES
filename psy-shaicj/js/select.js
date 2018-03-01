//选择省份
var province=["北京市", "天津市", "河北省", "河南省", "山西省", "山东省", "内蒙古自治区", "辽宁省", "吉林省", "黑龙江省", "上海市", "江苏省", "浙江省", "福建省", "江西省", "安徽省", "湖北省", "湖南省", "广东省", "广西壮族自治区", "海南省", "重庆市", "四川省", "贵州省", "云南省", "西藏自治区", "陕西省", "甘肃省", "青海省", "宁夏回族自治区", "新疆维吾尔自治区",  "全国"];
//选择考试类别
var type=["心理咨询师三级","心理咨询师二级"];
//只有trigger 和 wheels 是必要参数  其他都是选填参数
var mobileSelect1 = new MobileSelect({
    trigger: '#trigger1',
    title: ' ',
    wheels: [
                {data: province}
            ],
    position:[2] //初始化定位 打开时默认选中的哪个  如果不填默认为0
});
var mobileSelect2 = new MobileSelect({
    trigger: '#trigger2',
    title: ' ',
    wheels: [
                {data: type}
            ],
    position:[1] //初始化定位 打开时默认选中的哪个  如果不填默认为0
});
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
