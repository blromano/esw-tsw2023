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
      <title>Reservas</title>
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
                                 <a class="nav-link" href=" ">Bem vindo, $cliente</a>
                              </li>
                           </ul>
                           <div class="sign_btn"><a href="index.php">Sair</a></div>
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
                  <form class="form_gerenciar">
                     <div class="row">
     <!-- inicio tabela -->
     
                     <!-- Formulário de busca -->
                     <form class="form_index">
                        <div class="row">
                           <div class="col-md-3">
                              <label class="date">Check in</label>
                              <input class="book_n"  type="date" >
                           </div>
                           <div class="col-md-3">
                              <label class="date">Check out</label>
                              <input class="book_n"  type="date" >
                           </div>
                           <div class="col-md-2">
                            <label class="date">Adultos</label>
                            <select class="book_n" name="adults">
                              <option value="1">1</option>
                              <option value="2">2</option>
                              <option value="3">3</option>
                              <option value="4">4</option>
                              <option value="5">5</option>
                              <option value="6">6</option>
                              <option value="7">7</option>
                              <option value="8">8</option>
                              <option value="9">9</option>
                              <option value="10">10</option>
                            </select>
                          </div>
                          <div class="col-md-2">
                            <label class="date">Crianças</label>
                            <select class="book_n" name="children">
                              <option value="0">0</option>
                              <option value="1">1</option>
                              <option value="2">2</option>
                              <option value="3">3</option>
                              <option value="4">4</option>
                              <option value="5">5</option>
                            </select>
                          </div>
                           <div class="col-md-2">
                              <button class="book_btn">Pesquisar</button>
                           </div>
                        </div>
                     </form>
                  
                     <section class="quartos-disponiveis">
                        <br><br><br>
                        <table class="table table-striped">

                        <tbody>
                           
                           <tr>
                                <td>
                                    <img src="images/quartosala.png" alt="Quarto simples" width="100px" height="100px">
                                </td>
                                <td>
                                    <h3>Quarto simples</h3>
                                    <p>Para 2 pessoas</p>
                                    <p>1 Cama de casal</p>
                                </td>
                                <td>
                                    <h5>Tarifas</h5>
                                    <p>R$300,00 1 diária</p>
                                    <p>Pagamento à vista</p>
                                 </td>
                                 <td>
                                    <h5>Incluso</h5>
                                    <p>Café da manhã e Jantar</p>
                                    <p>Estacionamento</p>
                                    <p>Wi-Fi</p>
                                 </td>
                                 <td>
                                    <img src="images/icones.png" alt="Quarto simples" width="100px" height="100px">
                                 </td>
                                 <td>
                                    <p> <a class="read_more" href="telaCadastro.php"> Reservar </a> </p>
                                  </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="images/quartosala.png" alt="Quarto simples" width="100px" height="100px">
                                </td>
                                
                                 <td>
                                    <h3>Quarto duplo</h3>
                                    <p>Para 4 pessoas</p>
                                    <p>2 Camas de casal</p>
                                 </td>
                                 <td>
                                    <h5>Tarifas</h5>
                                    <p>R$550,00 1 diária</p>
                                    <p>Pagamento à vista</p>
                                 </td>
                                 <td>
                                    <h5>Incluso</h5>
                                    <p>Café da manhã e Jantar</p>
                                    <p>Estacionamento</p>
                                    <p>Wi-Fi</p>
                                 </td>
                                 <td>
                                    <img src="images/icones.png" alt="Quarto simples" width="100px" height="100px">
                                  </td>
                                  <td>
                                    <p> <a class="read_more" href="telaCadastro.html"> Reservar </a> </p>
                                  </td>
                            </tr>
                            <tr>
                                <td>
                                    <img src="images/quartosala.png" alt="Quarto simples" width="100px" height="100px">
                                </td>
                                
                                <td>
                                 <h3>Quarto familiar</h3>
                                 <p>Para 4 pessoas</p>
                                 <p>1 Cama de casal</p>
                                 <p>1 Cama beliche</p>
                              </td>
                              <td>
                                 <h5>Tarifas</h5>
                                 <p>R$650,00 1 diária</p>
                                 <p>Pagamento à vista</p>
                              </td>
                              <td>
                                 <h5>Incluso</h5>
                                 <p>Café da manhã e Jantar</p>
                                 <p>Estacionamento</p>
                                 <p>Wi-Fi</p>
                              </td>
                              <td>
                                 <img src="images/icones.png" alt="Quarto simples" width="100px" height="100px">
                               </td>
                              <td>
                                 <p> <a class="read_more" href="telaCadastro.html"> Reservar </a> </p>
                               </td>
                            </tr>
                                                      
                        </table>
                      </section>
               </div>
               <a class="nav-link" href="index.html">Voltar</a>
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


