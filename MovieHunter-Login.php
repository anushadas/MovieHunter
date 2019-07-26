<?php
    require_once("inc/config.inc.php");
    require_once("templates/Page.class.php");
    require_once("inc/Utilities/Validation.class.php");
    require_once("inc/Entities/User.class.php");
    require_once("inc/Utilities/PDOAgent.class.php");
    require_once("inc/Utilities/UserDAO.class.php");
    
    
    UserDAO::initialize();
    Page::Header();

    $errors = array();
    if($_SERVER['REQUEST_METHOD'] == 'POST'){
        $errors = Validation::validateLogin($_POST);
        if(empty($errors)) {
            try {
          
            $user = UserDAO::getUserEmail($_POST['email2']);
       
            if($user == null){
                throw new exception ("Incorrect username or password");
            }
            
           
                //Verifies that a user is returned and that their password
                //matches the one they entered
             
               
                if($user != null && $user->verifyPassword($_POST['password2']) == true)
                {
                    session_start();
                    var_dump($_POST['email2']);
                    $_SESSION['logged'] = $_POST['email2'];
                    header('Location: '."MovieHunter-Home.php");

                } else 
                {
                    throw new exception ("Incorrect username or password");
                } 

            } catch (exeception $ex)    {
                echo $ex->getMessage();
            }
            
        }
    }
    Page::showLogin($errors);
    Page::Footer();






?>