<?php

/**
 * Author : Kishor Mali
 * Filename : Chat.php
 * 
 * Class : Chat
 * This class is used for accepting and broadcasting the socket request
 */

namespace Chat;

use Chat\Repository\ChatRepository;

use Ratchet\MessageComponentInterface;
use Ratchet\ConnectionInterface;

class Chat implements MessageComponentInterface
{
  	protected $repository;

	/**
	 * Default constructor of the class
	 */
  	public function __construct()
  	{
    	$this->repository = new ChatRepository;
    	$this->conn = new Mydb();	
  	}
	
	/**
	 * This function is used to add the connected machine to queue
	 * @param {object} $conn : Connection interface object
	 */
  	public function onOpen(ConnectionInterface $conn)
  	{
    	$this->repository->addClient($conn);
  	}

  	public function onClose(ConnectionInterface $conn)
  	{
    	$this->repository->removeClient($conn);
  	}

  	public function onError(ConnectionInterface $conn, \Exception $e)
  	{
    	echo "The following error occured : ". $e->getMessage();
		$client = $this->repository->getClientByConnection($conn);
    	if($client !== null)
    	{
      		$client->getConnection()->close();
      		$this->repository->removeClient($conn);
		}
  	}

  	public function onMessage(ConnectionInterface $conn , $msg)
  	{
    	$data = $this->parseMessage($msg);
    	
    	$currClient = $this->repository->getClientByConnection($conn);
		
      	foreach ($this->repository->getClients() as $client)
      	{
      	    $this->conn->addRecord($data);
      	    $client->sendMsg("Successfully added ". $data->id);
		}
    	
  	}

  	private function parseMessage($msg)
  	{
    	return json_decode($msg);
  	}
}

class Mydb {
    
    function __construct(){
        $this->servername = 'localhost';
        $this->username = 'root';
        $this->password = '';
        $this->database = 'realtime';
    }
    
    public function addRecord($stringData) {
        $conn = new \mysqli($this->servername, $this->username, $this->password, $this->database);
        if($conn->connect_error){
            die('Connection failed: '.$conn->connect_error);
        } else {
            $sql = 'INSERT INTO `tbl_gesits` (transport_id, imei, speed, rpm, batt, lat, lon, created_at) 
                    VALUES ("'.$stringData->id.'", "'.$stringData->imei.'", "'.$stringData->speed.'", "'.$stringData->rpm.'", "'.$stringData->batt.'", "'.$stringData->lat.'", "'.$stringData->lon.'", "'.$stringData->created_at.'" )';
            if ($conn->query($sql) === TRUE) {
                echo "Add new record succesfully!";
            } else {
                echo "Error". $sql. "<br />". $conn->error;
            }
            $conn->close();
        }
    }
    
    
}

