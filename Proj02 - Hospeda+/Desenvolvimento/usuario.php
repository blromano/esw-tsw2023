<?php
session_start();
require_once 'models/Funcionario.php';
require_once 'db/FuncionarioDAOMysql.php';

require_once 'models/Cliente.php';
require_once 'db/ClienteDAOMysql.php';

if (isset($_SESSION['id_fun']) && !empty($_SESSION['id_fun'])) {
   $id = $_SESSION['id_fun'];

   if(isset($_GET['id'])){
      $id_cliente = $_GET['id'];

      $c = new ClienteDAOMysql();
      $c = $c->findById($id_cliente);
   }

   

}else {   
   header("Location: login.php");
}


if ($_SERVER["REQUEST_METHOD"] === "POST") {
   if (isset($_POST['NomeCompleto']) && !empty($_POST['NomeCompleto'])) {
      $id = $_POST['id_cliente'];
      $nomeCompleto = $_POST['NomeCompleto'];
      $dataNascimento = $_POST['DataNascimento'];
      $cpf = $_POST['CPF'];
      $rg = $_POST['RG'];
      $celular = $_POST['Celular'];
      $email = $_POST['email'];
      $sexo = $_POST['Sexo'];

      if($sexo == "Masculino"){
         $sexo = "M";
      }else{
         $sexo = "F";
      }

      $c = new Cliente();
      $c->setId_cliente($id);
      $c->setCli_nome($nomeCompleto);
      $c->setCli_nascimento($dataNascimento);
      $c->setCli_cpf($cpf);
      $c->setCli_rg($rg);
      $c->setCli_celular($celular);
      $c->setCli_email($email);
      $c->setCli_sexo($sexo);
      $cdao = new ClienteDAOMysql();

      $cdao->update($c);         
      
   }

   header("Location: gerenciarUsuario.php");
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
      <title>Usuário</title>
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
      <script>
         function confirmarExclusao() {
             var confirmacao = confirm("Tem certeza de que deseja excluir este usuário?");
 
             if (confirmacao) {
                 // Coloque o código para excluir o usuário aqui
                 alert("Usuário excluído com sucesso!");
             } else {
                 alert("A exclusão foi cancelada.");
             }
         }
     </script>
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
                                 <a class="nav-link" href="index.php">Tela Inicial</a>
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
                  <form class="form_cadastro" action="usuario.php" method="POST">
                     <div class="row">
                     <input style="display: none;" name="id_cliente" id="id_cliente" value="<?=$c->getId_Cliente();?>">
                        <div class="col-md-6">
                           <label class="date">Nome Completo</label>
                           <input class="book_n" placeholder="Nome Completo" type="type" name="NomeCompleto" id="NomeCompleto" value="<?=$c->getCli_nome();?>">
                        </div>
                        <div class="col-md-4">
                           <label class="date">Data de Nascimento</label>
                           <input class="book_n" placeholder="Data de Nascimento" type="type" name="DataNascimento" id="DataNascimento" value="<?=$c->getCli_nascimento();?>">
                        </div>
                        <div class="col-md-5">
                           <label class="date">CPF</label>
                           <input class="book_n" placeholder="CPF" type="type" name="CPF" id="CPF" value="<?=$c->getCli_cpf();?>">
                        </div>
                        <div class="col-md-5">
                           <label class="date">RG</label>
                           <input class="book_n" placeholder="RG" type="type" name="RG" id="RG" value="<?=$c->getCli_rg();?>">
                        </div>
                        <div class="col-md-5">
                           <label class="date">Sexo</label>
                              <select class="book_n" id="Sexo" name="Sexo"> 
                                 <option value="Masculino" <?php if ($c->getCli_sexo() == "M") { echo "selected"; } ?>>Masculino</option>
                                 <option value="Feminino" <?php if ($c->getCli_sexo() == "F") { echo "selected"; } ?>>Feminino</option>
                              </select>
                           </div>
                        <div class="col-md-5">
                           <label class="date">Celular</label>
                           <input class="book_n" placeholder="Celular" type="type" name="Celular" id="Celular" value="<?=$c->getCli_celular();?>">
                        </div>
                        <div class="col-md-10">
                           <label class="date">Email</label>
                           <input class="book_n" placeholder="Email" type="type" name="email" id="email" value="<?=$c->getCli_email();?>">
                        </div>
                        <div class="col-md-3">
                            <button class="book_btn">Alterar</button>
                        </div>
                        <a class="book_btn" id="btn_excluirUsuario">Excluir</a>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </section>
      <!-- end form_lebal -->
            <div class="copyright">
               <div class="container">
                  <div class="row">
                     <div class="col-md-12">
                        <p>Copyright 2023 All Right Reserved By <a href=" "> i6 - Tech </a></p>
                     </div>
                  </div>
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
      <script src="js/script.js"></script>
      <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
   </body>
</html>

