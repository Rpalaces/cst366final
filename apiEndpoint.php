<?php
include 'DBConnection.php';
$dbConn = getDatabaseConnection('races');
$date = date("Ymd");
$curr_date = (int)$date;
  session_start();

    $httpMethod = strtoupper($_SERVER['REQUEST_METHOD']);

    switch($httpMethod) {
      case "OPTIONS":
        // Allows anyone to hit your API, not just this c9 domain
        header("Access-Control-Allow-Headers: X-ACCESS_TOKEN, Access-Control-Allow-Origin, Authorization, Origin, X-Requested-With, Content-Type, Content-Range, Content-Disposition, Content-Description");
        header("Access-Control-Allow-Methods: POST, GET");
        header("Access-Control-Max-Age: 3600");
        exit();
      case "GET":
        $sql = "SELECT * FROM Races
        LEFT JOIN `Status`
        ON Races.race_id = Status.race_id
        WHERE Races.date >= $curr_date AND Status.status != 'Canceled'
        ORDER BY Races.date ";
        $stmt = $dbConn->prepare($sql);
        $stmt->execute( array (':Races.race_id'=>$jsonData["race_id"],':Races.date'=>$jsonData["date"], ':Races.start_time'=>$jsonData["start_time"], ':Races.password'=>$jsonData["password"], ':Races.locatio'=>$jsonData["locatio"],':Status.status'=>$jsonData["status"] ));
        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
        header("Access-Control-Allow-Origin: *");
        // Let the client know the format of the data being returned
        header("Content-Type: application/json");

        // Sending back down as JSON
        echo json_encode($results);
        
        break;
      case "POST":
        $rawJsonString = file_get_contents("php://input");
        
        $jsonData = json_decode($rawJsonString, true);
        
        $sql = "INSERT INTO Races (race_id, date, start_time, password, locatio)
        VALUES (:race_id, :date, :start_time, :password, :locatio)";
        // use exec() because no results are returned
        $stmt = $dbConn->prepare($sql);
        $stmt->execute( array (':race_id' => $jsonData["race_id"],':date'=>$jsonData["date"], ':start_time'=>$jsonData["start_time"], ':password'=>$jsonData["password"], ':locatio'=>$jsonData["locatio"]));
        
        $sql = "INSERT INTO Status (race_id, status)
        VALUES (:race_id, :status)";
        // use exec() because no results are returned
        $stmt = $dbConn->prepare($sql);
        $stmt->execute( array (':race_id' => $jsonData["race_id"],':status'=>$jsonData["status"]));
        
        
        $results = array("status" => 0, "message" => "all good");
        header("Access-Control-Allow-Origin: *");
        // Let the client know the format of the data being returned
        header("Content-Type: application/json");

        // Sending back down as JSON
        echo json_encode($results);
        break;
    }
?>