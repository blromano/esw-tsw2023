

<!DOCTYPE html>
<html lang="en">
   <head>
      <!-- basics -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>Hospeda+</title>
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
                                 <a class="nav-link" href="#about">Sobre</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" href="#contact">Contatos</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" href="telaCadastro.php">Cadastro</a>
                              </li>
                           </ul>
                           <div class="sign_btn"><a href="login.php">Entrar</a></div>
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
                        <h1> Bem-vindo ao {$nome_hotel} <br> O refúgio perfeito para a sua estadia! </h1>
                        <!--<span>LANDING PAGE 2019</span>-->
                        <p>Descubra uma experiência de hospedagem excepcional no {$nome_hotel}, onde o conforto e a elegância se encontram para criar memórias inesquecíveis. Localizado [localização], o nosso hotel é o destino ideal tanto para viajantes a negócios quanto para aqueles que desejam desfrutar de momentos relaxantes em uma atmosfera luxuosa.</p>
                        <a class="read_more" href="reserveagora.php"> Reserve agora </a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <!-- end banner -->
      <!-- form_lebal -->
      
      <!-- end form_lebal -->
      <!-- choose  section -->
      <section>
      <div class="container">
         <div class="row">
            <div class="col-md-12">
               <form class="form_index">
                  <div class="row">
                     <div class="titlepage">
                        <!-- quero centralizar aqui embaico mas nao consigo -->
                        <h2>Charme, conforto e elegância <span class="text_norlam"> </span></h2>
                        
                     </div>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </section><div class="choose">
         <div class="container">
            <div class="row">
               <div class="col-md-6">
                  <div class="choose_box">
                     <div class="titlepage">
                        <h2>Acomodações de luxo <span class="text_norlam"> para todos os gostos</span></h2>
                     </div>
                     <p>No {$nome_hotel}, valorizamos a satisfação de nossos hóspedes e oferecemos uma variedade de acomodações requintadas para atender a todas as suas necessidades. Desde quartos elegantes até suítes espaçosas, cada espaço foi cuidadosamente projetado para proporcionar conforto e comodidade. Nossos quartos estão equipados com comodidades modernas, como camas confortáveis, banheiros luxuosos e acesso Wi-Fi de alta velocidade, garantindo que você tenha uma estadia relaxante e produtiva. Reserve agora e comece a criar memórias inesquecíveis</p>
                     <a class="read_more" href="reserveagora.php"> Reserve agora </a>
                  </div>
               </div>
               <div class="col-md-6">
                  <div class="row">
                     <div class="col-md-12">
                        <div class="img_box">
                           <figure><img src="images/img1.jpg" alt="#"/></figure>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <div class="img_box">
                           <figure><img src="images/img2.jpg" alt="#"/></figure>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <div class="img_box">
                           <figure><img src="images/img3.jpg" alt="#"/></figure>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- end choose  section -->
      <!-- our  section -->
      <div class="our">
         <div class="container">
            <div class="row d_flex">
               <div class="col-md-6">
                  <div class="img_box">
                     <figure><img src="images/img4.jpg" alt="#"/></figure>
                  </div>
               </div>
               <div class="col-md-6">
                  <div class="our_box">
                     <div class="titlepage">
                        <h2><span class="text_norlam"> Café da manhã </span> <br> com várias opções </h2>
                     </div>
                     <p>Comece o seu dia com um delicioso café da manhã. Valorizamos a importância de uma refeição matinal nutritiva e saborosa para energizá-lo e prepará-lo para um dia cheio de atividades. Nosso café da manhã é cuidadosamente preparado com uma variedade de opções frescas e saudáveis para atender aos diferentes gostos e preferências dos nossos hóspedes. </p>
                     <a class="read_more" href="reserveagora.php"> Reserve agora </a>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- end our  section -->
      <!-- about -->
      <div id="about"  class="about">
         <div class="container-fluid">
            <div class="row d_flex">
               <div class="col-md-6">
                  <div class="about_text">
                     <div class="titlepage">
                        <h2> Sobre o hotel</h2>
                        <p>O {$nome_hotel} é um estabelecimento de renome que oferece uma experiência de hospedagem excepcional aos seus hóspedes. Com uma localização privilegiada em [localização], nosso hotel é uma escolha popular tanto para viajantes a negócios quanto para aqueles que desejam desfrutar de momentos relaxantes em um ambiente luxuoso. Nosso objetivo é criar memórias inesquecíveis para cada hóspede. Reserve conosco e permita-nos proporcionar a você uma experiência de hospedagem excepcional que excede todas as suas expectativas. Estamos ansiosos para recebê-lo em nosso hotel de luxo e garantir que sua estadia seja verdadeiramente memorável.</p>
                     </div>
                  </div>
               </div>
               <div class="col-md-6">
                  <div class="about_img">
                     <figure><img src="images/about_img.jpg" alt="#"/></figure>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- end about -->
      <!-- testimonial -->
      <div class="testimonial">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="titlepage">
                     <h2><a href="telaFeedback.php">Feedbacks</a></h2>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-md-12">
                  <div id="myCarousel" class="carousel slide testimonial_Carousel " data-ride="carousel">
                     <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                     </ol>
                     <div class="carousel-inner">
                        <div class="carousel-item active">
                           <div class="container">
                              <div class="carousel-caption ">
                                 <div class="row">
                                    <div class="col-md-6 margin_boot">
                                       <div class="test_box">
                                          <h4>Bruno </h4>
                                          <i><img src="images/te1.png" alt="#"/></i>
                                          <p>Minha estadia no {$nome_hotel} foi simplesmente incrível! O serviço prestado pela equipe foi excepcional desde o momento em que fiz o check-in até o momento do check-out.</p>
                                       </div>
                                    </div>
                                    <div class="col-md-6">
                                       <div class="test_box">
                                          <h4>Luís </h4>
                                          <i><img src="images/te1.png" alt="#"/></i>
                                          <p>O {$nome_hotel} superou todas as minhas expectativas. Desde a decoração elegante até o serviço impecável, tudo foi perfeito. Destaco especialmente o café da manhã delicioso, com uma variedade incrível de opções frescas. </p>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="carousel-item">
                           <div class="container">
                              <div class="carousel-caption">
                                 <div class="row">
                                    <div class="col-md-6 margin_boot">
                                       <div class="test_box">
                                          <h4>Jennifer</h4>
                                          <i><img src="images/te1.png" alt="#"/></i>
                                          <p>Fiquei impressionada com a atenção aos detalhes no {$nome_hotel}. A equipe estava sempre pronta para ajudar e fornecer recomendações úteis sobre o que fazer na região.</p>
                                       </div>
                                    </div>
                                    <div class="col-md-6">
                                       <div class="test_box">
                                          <h4>Petrik</h4>
                                          <i><img src="images/te1.png" alt="#"/></i>
                                          <p>Superou todas as minhas expectativas. Destaco especialmente o café da manhã delicioso, com uma variedade incrível de opções frescas. </p>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="carousel-item">
                           <div class="container">
                              <div class="carousel-caption">
                                 <div class="row">
                                    <div class="col-md-6 margin_boot">
                                       <div class="test_box">
                                          <h4>Daniel</h4>
                                          <i><img src="images/te1.png" alt="#"/></i>
                                          <p> O local perfeito para relaxar e recarregar as energias. A atmosfera tranquila e os belos jardins proporcionam um ambiente sereno. </p>
                                       </div>
                                    </div>
                                    <div class="col-md-6">
                                       <div class="test_box">
                                          <h4>Guilherme</h4>
                                          <i><img src="images/te1.png" alt="#"/></i>
                                          <p> A a localização do hotel é perfeita, com fácil acesso a lojas, restaurantes e atrações locais. Com certeza voltarei e recomendo este hotel a todos os viajantes. </p>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
                     <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                     <span class="sr-only">Previous</span>
                     </a>
                     <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
                     <span class="carousel-control-next-icon" aria-hidden="true"></span>
                     <span class="sr-only">Next</span>
                     </a>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- end testimonial -->
      <!--  footer -->
      <footer id="contact">
         <div class="footer">
            <div class="container">
               <div class="row">
                  <div class="col-md-6">
                     <div class="titlepage">
                        <h2>Entre em contato conosco</h2>
                     </div>
                     <div class="cont">
                        <p>Se você tiver alguma dúvida, comentário ou solicitação, não hesite em entrar em contato conosco. Nossa equipe dedicada está pronta para ajudar e fornecer informações adicionais sobre o {$nome_hotel}.</p>
                     </div>
                  </div>
                  <div class="col-md-6">
                     <form id="request" class="main_form">
                        <div class="row">
                           <div class="col-md-12 ">
                              <input class="contactus" placeholder="Nome completo" type="type" name="Nome completo"> 
                           </div>
                           <div class="col-md-12">
                              <input class="contactus" placeholder="Email" type="type" name="Email"> 
                           </div>
                           <div class="col-md-12">
                              <input class="contactus" placeholder="Celular" type="type" name="Celular">                          
                           </div>
                           <div class="col-md-12">
                              <textarea class="textarea" placeholder="Mensagem" type="type" Message="Name">Mensagem </textarea>
                           </div>
                           <div class="col-sm-12">
                              <button class="send_btn">Enviar</button>
                           </div>
                        </div>
                     </form>
                  </div>
               </div>
            </div>
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

