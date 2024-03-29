<?php
    require_once("inc/config.inc.php");
    require_once("templates/Page.class.php");
    require_once("inc/Utilities/LoginManager.class.php");
    require_once("inc/Utilities/Validation.class.php");
    require_once("inc/Entities/User.class.php");
    require_once("inc/Utilities/PDOAgent.class.php");
    require_once("inc/Utilities/DAO/UserDAO.class.php");
    
    
    UserDAO::initialize();
    Page::Header();
   
    $errors = array();
    $msg ="";

    if($_SERVER['REQUEST_METHOD'] == 'POST'){
        
        $errors = Validation::validateLogin($_POST);
        if(empty($errors)) {
            try {
 
            if(UserDAO::getUserEmail($_POST['email2']) == false || UserDAO::getUserEmail($_POST['email2']) == null){
                throw new exception ("Username does not exist!");
            } else {
                $user = UserDAO::getUserEmail($_POST['email2']);
             
            }
       
                if($user != null && $user->verifyPassword($_POST['password2']) == true)
                {
                    session_start();
                    $_SESSION['logged'] = $_POST['email2'];
                    header('Location: '."MovieHunter-Home.php");

                } else 
                {
                    throw new exception ("Incorrect username or password");
                } 

            } catch (exception $ex)    {
                $msg = $ex->getMessage();
            }
            
        }
    }


    if (!empty($_GET))    {
        if(isset($_GET["SignUpMsg"])){
           $msg = $_GET["SignUpMsg"]."<BR>Please Sign In";
        }
    }

    Page::showLogin($errors,$msg);
    Page::Footer();






?>