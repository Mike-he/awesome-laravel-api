<?php

$qishu = '51644533';

$mysqli = new MySQLi("127.0.0.1","root","Wz123456","bc72",3306);
$mysqli->query("set names utf8");

$sql = <<<SQL
    SELECT SUM(money) as m_sum,jieguo
    FROM `c_bet3`
    WHERE type = '极速飞艇'
    AND qishu = {$qishu}
    GROUP BY jieguo
    ORDER BY m_sum DESC
SQL;

$query = $mysqli->query($sql);

if ($query) {
    $rows = [];
    while ($row = $query->fetch_assoc()) {
        array_push($rows, $row);
    }
    echo json_encode($rows);
}