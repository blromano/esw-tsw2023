<?php
session_start();

require_once 'models/Cliente.php';
require_once 'db/ClienteDAOMysql.php';

if (isset($_SESSION['id']) && !empty($_SESSION['id'])) {
   header("Location: telaprincipal.php");
}
if ($_SERVER["REQUEST_METHOD"] === "POST") {
   if (isset($_POST['NomeCompleto']) && !empty($_POST['NomeCompleto'])) {
      $nomeCompleto = $_POST['NomeCompleto'];
      $dataNascimento = $_POST['DataNascimento'];
      $cpf = $_POST['CPF'];
      $rg = $_POST['RG'];
      $celular = $_POST['Celular'];
      $email = $_POST['email'];

      $cidade = $_POST['cidade'];
      $numero = $_POST['numero'];
      $senha = $_POST['senha'];
      $sexo = $_POST['Sexo'];
      $cep = '1';
      $estado = 's';
      $bairro = 's';

      if($sexo == "Masculino"){
         $sexo = "M";
      }else{
         $sexo = "F";
      }

      $c = new Cliente();
      $c->setCli_nome($nomeCompleto);
      $c->setCli_nascimento($dataNascimento);
      $c->setCli_cpf($cpf);
      $c->setCli_rg($rg);
      $c->setCli_celular($celular);
      $c->setCli_email($email);

      $c->setCli_cidade($cidade);
      $c->setCli_numero($numero);
      $c->setCli_senha($senha);
      $c->setCli_sexo($sexo);
      $c->setCli_cep($cep);
      $c->setCli_estado($estado);
      $c->setCli_bairro($bairro);

      $data = new ClienteDAOMysql();
      
      header("Location: login.php");
      $data = $data->add($c);

               
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
      <title>Cadastro</title>
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
                  <form class="form_cadastro" action="telaCadastro.php" method="post">
                     <div class="row">
                        <div class="col-md-6">
                           <label class="date">Nome Completo</label>
                           <input class="book_n" placeholder="Nome Completo" type="text" name="NomeCompleto">
                        </div>
                        <div class="col-md-4">
                           <label class="date">Data de Nascimento</label>
                           <input class="book_n" placeholder="Data de Nascimento" type="date" name="DataNascimento">
                        </div>
                        <div class="col-md-5">
                           <label class="date">CPF</label>
                           <input class="book_n" placeholder="CPF" type="text" name="CPF">
                        </div>
                        <div class="col-md-5">
                           <label class="date">RG</label>
                           <input class="book_n" placeholder="RG" type="text" name="RG">
                        </div>
                        <div class="col-md-5">
                           <label class="date">Sexo</label>
                              <select class="book_n" name="Sexo"> 
                                 <option value="Masculino">Masculino</option>
                                 <option value="Feminino">Feminino</option>
                              </select>
                           </div>
                        <div class="col-md-5">
                           <label class="date">Celular</label>
                           <input class="book_n" placeholder="Celular" type="text" name="Celular">
                        </div>
                        <div class="col-md-10">
                           <label class="date">Email</label>
                           <input class="book_n" placeholder="Email" type="email" name="email">
                        </div>
                        <div class="col-md-6">
                           <label class="date">Cidade</label>
                           <input class="book_n" placeholder="Cidade" type="text" name="cidade">
                        </div>
                        <div class="col-md-4">
                           <label class="date">Nº</label>
                           <input class="book_n" placeholder="nº" type="text" name="numero">
                        </div>
                        <div class="col-md-4">
                           <label class="date">Senha</label>
                           <input class="book_n" placeholder="Senha" type="password" name="senha">
                        </div>
                        <div class="col-md-4">
                           <label class="date">Confirmar Senha</label>
                           <input class="book_n" placeholder="Confirmar Senha" type="password" name="confSenha">
                        </div>
                        <div class="col-md-3">
                           <button class="book_btn">Cadastrar</button>
                        </div>
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
      <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
   </body>
</html>

