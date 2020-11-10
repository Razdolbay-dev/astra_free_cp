<?php
//header("Content-Type: application/json");

$servername = 'localhost';
$username = 'root';
$password = 'BULDvat1';
$dbname = 'astra';

$link = new mysqli($servername, $username, $password, $dbname);
if ($mysqli->connect_error) {
    die('Connect Error (' . $mysqli->connect_errno . ') ' . $mysqli->connect_error);
}

//parsing json;
$data = json_decode(file_get_contents("php://input"), true);
//$json ='{"snr":84.613037109375,"unc":-2,"ber":0,"adapter":"2","signal":73.344421386719,"status":31,"type":"dvb"}';
//$data = json_decode($json, true);
//?channel_id="Super"&scrambled=0&bitrate=987&cc_error=0&pes_error=0&ready=1}
//вытягиваем данные;
$type = $data['type'];

if ($type == "stream"){
  $sql = 'UPDATE core_stream SET bitrate = "'.$data['bitrate'].'", cc_error = "'.$data['cc_error'].'" , pes_error = "'.$data['pes_error'].'" WHERE stream_id = "'.$data['channel_id'].'";';
}
elseif ($type == "dvb"){
  $sql = 'UPDATE core_tuner SET snr = "'.$data['snr'].'", bitrate = "'.$data['signal'].'" , unc = "'.$data['unc'].'" , ber = "'.$data['ber'].'" WHERE adapter_id = "'.$data['adapter'].'" and dvb_id = "'.$data['name'].'" ;';
}

if ($link->query($sql) === TRUE) {
    echo "Insert your JSON record successfully";
  } 
?>

