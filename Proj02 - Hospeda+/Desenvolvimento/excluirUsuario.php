<?php
session_start();
require_once 'models/Funcionario.php';
require_once 'db/FuncionarioDAOMysql.php';

require_once 'models/Cliente.php';
require_once 'db/ClienteDAOMysql.php';

if (isset($_SESSION['id_fun']) && !empty($_SESSION['id_fun'])) {
   $id = $_SESSION['id_fun'];

   if(isset($_POST['id'])){
      $id_cliente = $_POST['id'];

      $f = new FuncionarioDAOMysql();
      $f = $f->findById($id);

      $c = new ClienteDAOMysql();
      $c->delete($id_cliente);
   }

   

}else {   
   header("Location: login.php");
}

?>