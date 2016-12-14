<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
        
        // put full path to Smarty.class.php
require('../libs/Smarty.class.php');
$smarty = new Smarty();

$smarty->setTemplateDir('../smarty/templates');
$smarty->setCompileDir('../smarty/templates_c');
$smarty->setCacheDir('../smarty/cache');
$smarty->setConfigDir('../smarty/configs');

//basic variable assignments
$smarty->assign('name', 'Ned');

$drafts_array=array("test1","test2");

$smarty->assign('total_drafts', 20);
$smarty->assign('drafts_array',$drafts_array);

// display template
$smarty->display('index.tpl');
        ?>
    </body>
</html>
