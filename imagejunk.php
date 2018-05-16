<?php
function createImage(){
                $sourcefile = imagecreatefromstring(file_get_contents($_FILES["fileName"]["tmp_name"]));
                $newx = 500; $newy = 200;  //new size
                $thumb = imagecreatetruecolor($newx,$newy);
                imagecopyresampled($thumb, $sourcefile, 0,0,0,0, $newx, $newy,
                imagesx($sourcefile), imagesy($sourcefile)); 
                imagejpeg($thumb,"img/banner.jpg"); //creates jpg image file called "banner.jpg"
                echo "<img src='img/banner.jpg' alt='banner'/>";
            }
function filterUploadedFile() {
                $allowedTypes = array("text/plain","image/png",
                                      "image/jpg", "image/jpeg", "image/gif");
                $allowedExtensions = array("txt", "png", "jpg", "jpeg", "gif");
                $allowedSize = 10000;
                $filterError = "";

                // check file types
                if (!in_array($_FILES["fileName"]["type"], $allowedTypes))
                {
                    $filterError = "Invalid type. <br>";
                }

                // check file name
                $filename = $_FILES["fileName"]["name"];
                if (!in_array(substr($filename, strpos($filename, ".") + 1), $allowedExtensions))
                {
                    $filterError = "Ivalid extension. <br>";
                }

                if (($_FILES["fileName"]["size"]/1024) > $allowedSize)
                {
                    $filterError = "File size is too big.<br>";
                }

                return $filterError;
            }
?>