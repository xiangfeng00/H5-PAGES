<?php
// 每个对应的图片与抽中几率
$prize_arr = array(
    '0' => array('id' => 1, 'prize' => 'images/none.png', 'v' => 30),
    '1' => array('id' => 2, 'prize' => 'images/iphone7.png', 'v' => 5),
    '2' => array('id' => 3, 'prize' => 'images/jifen.png', 'v' => 15),
    '3' => array('id' => 4, 'prize' => 'images/libao.png', 'v' => 10),
    '4' => array('id' => 5, 'prize' => 'images/coin.png', 'v' =>5 ),
    '5' => array('id' => 6, 'prize' => 'images/crash.png', 'v' => 10),
    '7' => array('id' => 4, 'prize' => 'images/vip.png', 'v' => 10),
    '8' => array('id' => 5, 'prize' => 'images/libao.png', 'v' => 10),
    '9' => array('id' => 6, 'prize' => 'images/coin.png', 'v' =>5 ),
);
foreach ($prize_arr as $key => $val) {
    $arr[$val['id']] = $val['v'];
}

$rid = get_rand($arr); //根据概率获取奖项id

$res['yes'] = $prize_arr[$rid - 1]['prize']; //中奖项
unset($prize_arr[$rid - 1]); //将中奖项从数组中剔除，剩下未中奖项
shuffle($prize_arr); //打乱数组顺序
for ($i = 0; $i < count($prize_arr); $i++) {
    $pr[] = $prize_arr[$i]['prize'];
}
$res['no'] = $pr;
echo json_encode($res);

function get_rand($proArr) {
    $result = '';

    //概率数组的总概率精度
    $proSum = array_sum($proArr);

    //概率数组循环
    foreach ($proArr as $key => $proCur) {
        $randNum = mt_rand(1, $proSum);
        if ($randNum <= $proCur) {
            $result = $key;
            break;
        } else {
            $proSum -= $proCur;
        }
    }
    unset($proArr);

    return $result;
}
