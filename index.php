<?php

    //basic variable assignments
   
    //setcookie("cookiename", "cookiedata");
   
    
    $total_drafts=20;
    $drafts_array =  array_fill(0, $total_drafts, "");
   
    // get data from cookie if set
    if(isset($_COOKIE['tweets_cookie'])){
        $debug_info.="\nLine 13: cookie is set";
        $cookie = $_COOKIE['tweets_cookie'];
        $cookie = stripslashes($cookie);
        $drafts_array = json_decode($cookie);
        $debug_info.="\nLine 17: cookie is".$cookie;
    }


    if ($_SERVER["REQUEST_METHOD"] === "GET") {

        $debug_info.="\nLine 23: method is get";
        $debug_info.="\ni3 is ".$_GET[3];
       
        foreach ($drafts_array as $key =>$value) {
             
           
            $drafts_array[$key] = test_input($_GET[$key]);
               
               // echo $changed;
                    
        }

            
        
        // assign array to cookie
        $array_to_put = json_encode($drafts_array);
        setcookie('tweets_cookie', $array_to_put);

    } else {

        $drafts_array =  array_fill(0, $total_drafts, "");


    }

?>


<!DOCTYPE html>
<html>
  
    
        <?php
        
        function test_input($data) {//tests input from forms
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}

//chars
foreach($drafts_array as $key => $value){
    $chars[$key]=strlen($value);
}
   
      // echo $_SERVER["REQUEST_METHOD"];
   
       
        // put full path to Smarty.class.php
require('../libs/Smarty.class.php');
$smarty = new Smarty();

$smarty->setTemplateDir('../smarty/templates');
$smarty->setCompileDir('../smarty/templates_c');
$smarty->setCacheDir('../smarty/cache');
$smarty->setConfigDir('../smarty/configs');







//does Smarty assign for all the elements of the vars array
$vars_array=array("debug_info","left_pos","top_pos","chars");
//setSmartyVars($vars_array);
foreach ($vars_array as $d){
    $smarty->assign($d, $$d); 
}


$smarty->assign('total_drafts', $total_drafts);
$smarty->assign('drafts_array',$drafts_array);
$smarty->assign('form_action',$form_action);

// display template
$smarty->display('index.tpl');
        ?>
    
</html>
