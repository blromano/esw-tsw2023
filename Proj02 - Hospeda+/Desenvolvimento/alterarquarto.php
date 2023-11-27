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

      $q = new QuartoDAOMysql();
      $q = $q->findById($id_quarto);
   }

   

}else {   
   header("Location: login.php");
}

if ($_SERVER["REQUEST_METHOD"] === "POST") {
   if (isset($_POST['numero']) && !empty($_POST['numero'])) {
      if (isset($_POST['capacidade']) && !empty($_POST['capacidade'])) {
         if (isset($_POST['tipo_cama']) && !empty($_POST['tipo_cama'])) {
            if (isset($_POST['tipo_disponibilidade']) && !empty($_POST['tipo_disponibilidade'])) {
               if (isset($_POST['diaria']) && !empty($_POST['diaria'])) {
                  $numero = $_POST['numero'];
                  $capacidade = $_POST['capacidade'];
                  $tipo_cama = $_POST['tipo_cama'];
                  $disponibilidade = $_POST['tipo_disponibilidade'];
                  $diaria = $_POST['diaria'];

                  if($disponibilidade == 'disponivel'){
                     $disponibilidade = 1;
                  }else{
                     $disponibilidade = 0;
                  }
                  
                  $q = new Quarto();
                  $q->setId_quarto($numero);
                  $q->setQrt_capacidade($capacidade);
                  $q->setQrt_tipo_cama($tipo_cama);
                  $q->setQrt_disponivel($disponibilidade);
                  $q->setQrt_preco_diaria($diaria);

                  $qdao = new QuartoDAOMysql();
                  
                  header("Location: listarquartos.php");
                  $qdao->update($q); 
               }
            }
         }
      }
   }

   http_response_code(400);
   echo json_encode(array("success" => false, "message" => "Parâmetros inválidos"));
   exit();
}

?>

<!DOCTYPE html>
<html lang="pt-br">
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>Alterar Quartos</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- bootstrap css -->
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" href="css/style.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="images/fevicon.png" type="image/gif" />
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
   </head>
   <!-- body -->
   <body class="main-layout">
      <!-- loader  -->
      <div class="loader_bg">
         <div class="loader"><img src="images/loading.gif" alt="#" /></div>
      </div>
      <!-- end loader -->
      <!-- header -->
      <header>
         <!-- header inner -->
         <div class="header">
            <div class="container">
               <div class="row">
                  <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
                     <div class="full">
                        <div class="center-desk">
                           <div class="logo">
                              <a href="index.php"><img src="images/logo.png" alt="#" /></a>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="col-xl-9 col-lg-9 col-md-9 col-sm-9">
                     <nav class="navigation navbar navbar-expand-md navbar-dark ">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarsExample04">
                           <ul class="navbar-nav mr-auto">
                              <li class="nav-item">
                                 <a class="nav-link" href="telaprincipalfuncionario.php">Painel</a>
                              </li>
                           </ul>
                        </div>
                     </nav>
                  </div>
               </div>
            </div>
         </div>
      </header>
      <!-- end header inner -->
      <!-- end header -->
      <!-- banner -->
      <section class="banner_main">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="text-bg">
                     <div class="padding_lert">

                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- end banner -->
      <!-- form_lebal -->
      <section>
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <form class="form_cadastro" action="alterarquarto.php" method="post">
                     <div class="form-group">
                      <label for="numero">Número do Quarto:</label>
                      <input class="book_n" type="text" id="numero" name="numero"  value="<?=$q->getId_quarto();?>" disabled>
                   </div>
                     <div class="form-group">
                      <label for="capacidade">Capacidade:</label>
                      <input class="book_n" type="text" id="capacidade" name="capacidade" value="<?=$q->getQrt_capacidade();?>" required>
                   </div>
                     <div class="form-group">
                      <label for="tipo_cama">Tipo de Cama:</label>
                      <select class="book_n" id="tipo_cama" name="tipo_cama" required>
                        <option value="Solteiro" <?php if ($q->getQrt_tipo_cama() == "Solteiro") { echo "selected"; } ?>>Solteiro</option>
                        <option value="Casal" <?php if ($q->getQrt_tipo_cama() == "Casal") { echo "selected"; } ?>>Casal</option>
                        <option value="Queen" <?php if ($q->getQrt_tipo_cama() == "Queen") { echo "selected"; } ?>>Queen</option>
                        <option value="King" <?php if ($q->getQrt_tipo_cama() == "King") { echo "selected"; } ?>>King</option>
                      </select>
                   </div>
                   <div class="form-group">
                      <label for="disponibilidade">Disponibilidade:</label>
                      <select class="book_n" id="tipo_disponibilidade" name="tipo_disponibilidade" required>
                           <option value="disponivel" <?php if ($q->getQrt_disponivel() == "1") { echo "selected"; } ?>>Disponível</option>
                           <option value="indisponivel" <?php if ($q->getQrt_disponivel() == "0") { echo "selected"; } ?>>Indisponível</option>
                      </select>
                   </div>
                   <div class="form-group">
                      <label for="diaria">Preço da Diaria:</label>
                      <input class="book_n" type="text" id="diaria" name="diaria" value="<?=$q->getQrt_preco_diaria();?>" required>
                   </div>
                     <div class="col-md-3">
                      <button class="book_btn">Editar</button>
                   </div>
                  </form>
               </div>
            </div>
         </div>
      </section>
      <!-- end form_lebal -->
      <footer>
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <p>Copyright 2023 All Right Reserved By
                     <a href=" "> i6 - Tech </a>
                  </p>
               </div>
            </div>
         </div>
      </footer>
      <!-- end footer -->
      <!-- Javascript files-->
      <script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.bundle.min.js"></script>
      <script src="js/jquery-3.0.0.min.js"></script>
      <script src="js/plugin.js"></script>
      <!-- sidebar -->
      <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="js/custom.js"></script>
      <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
      <script>
         document.getElementById("submitBtn").addEventListener("click", function() {
           // Aqui você pode adicionar qualquer lógica personalizada antes de redirecionar
           // Por exemplo, validação de formulário ou manipulação de dados
           // Após a lógica, redirecione para a página desejada usando:
           window.location.href = "outra_pagina.html";
         });
      </script>
   </body>
</html>