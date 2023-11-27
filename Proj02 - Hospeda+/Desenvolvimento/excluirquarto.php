<?php
session_start();
require_once 'models/Funcionario.php';
require_once 'db/FuncionarioDAOMysql.php';

require_once 'models/Quarto.php';
require_once 'db/QuartoDAOMysql.php';

if (isset($_SESSION['id_fun']) && !empty($_SESSION['id_fun'])) {
   $id = $_SESSION['id_fun'];

   if(isset($_GET['id'])){
      $id_quarto = $_GET['id'];

      $f = new FuncionarioDAOMysql();
      $f = $f->findById($id);

      $q = new QuartoDAOMysql();
      if ($q->delete($id_quarto)) {
         header("Location: listarquartos.php?status=success&id_quarto=$id_quarto");
      }else {
         header("Location: listarquartos.php?status=failed&id_quarto=$id_quarto");
      }
   }

   

}else {   
   header("Location: login.php");
}

?>