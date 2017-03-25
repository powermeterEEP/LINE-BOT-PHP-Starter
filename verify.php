<?php
$proxy = 'velodrome.usefixie.com:80';
$proxyauth = 'fixie:ZZ4nTjwPCevMpr8';
$access_token = 'w1wEzIFHJY2D9LB6vwEqPbX9WTE6CQCiIwv6IkfAvBIjQxorpgDGWsKZ9ePO6lAjYv7fdZOVwlkuCi0y1T2yjF7ErUf38VL8BJ1x9ipB5Joc2YgJTIRBNBqzpVuSb71FJupY/GBTifzq/HqW3M12NwdB04t89/1O/w1cDnyilFU=';

$url = 'https://api.line.me/v1/oauth/verify';

$headers = array('Authorization: Bearer ' . $access_token);

$ch = curl_init($url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
curl_setopt($ch, CURLOPT_PROXY, $proxy);
curl_setopt($ch, CURLOPT_PROXYUSERPWD, $proxyauth);
$result = curl_exec($ch);
curl_close($ch);

echo $result;
