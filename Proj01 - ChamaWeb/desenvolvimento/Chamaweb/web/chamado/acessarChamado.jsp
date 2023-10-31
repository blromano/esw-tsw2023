<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="en">

<head>
  <title>Visualizar Chamado</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS v5.2.1 -->
  <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
      crossorigin="anonymous"
    />

    <link href="${cp}/css/style.css" rel="stylesheet">
</head>

<body data-bs-theme="dark">
  <header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-black">
        <div class="container-fluid">   
            <a class="navbar-brand" href="#">
                <!--<img src="src/chamaweb.png" alt="" height="50" class="d-inline-block align-text-top">-->
                Chamaweb
              </a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link" aria-current="page" href="${cp}/chamado/meusChamados.jsp">Meus Chamados</a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  Técnico
                </a>
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <h6 class="dropdown-header">Listagens</h6>
                  <li><a class="dropdown-item" href="${cp}/maquina/listagemMaquinas.jsp">Máquinas</a></li>
                  <li><a class="dropdown-item" href="${cp}/chamado/listagemChamados.jsp">Chamados</a></li>
                  <li><a class="dropdown-item" href="${cp}/laboratorio/listagemLaboratorios.jsp">Laboratórios</a></li>
                  <li><a class="dropdown-item" href="${cp}/problema/listagemProblemas.jsp">Categorias de Problemas</a></li>
                </ul>
              </li>
            </ul>
            <button type="button" class="btn btn-danger" onclick="window.open('${cp}/chamado/abrirChamado.jsp', '_self')">Abrir Chamado</button>
          </div>
        </div>
      </nav>
  </header>
  <main>
    <div class="card col-sm-8" style="min-width: 400px; margin: auto auto; margin-top: 5vh; padding: 15px ; outline: 1px lightgray solid; border-radius: 5px;"">
      <h5>Chamado #0001</h5>
      <table class="table table-striped">
        <tbody style="vertical-align: middle;">
          <tr>
            <th scope="row">TÃ­tulo</th>
            <td>PC nÃ£o liga</td>
          </tr>
          <tr>
            <th scope="row">Estado</th>
            <td>Pendente</td>
          </tr>
          <tr>
            <th scope="row">Data</th>
            <td>19/06/2023 12:57</td>
          </tr>
          <tr>
            <th scope="row">UsuÃ¡rio</th>
            <td>JoÃ£o da Silva</td>
          </tr>
          <tr>
            <th scope="row">TÃ©cnico</th>
            <td>Jonas Johnson</td>
          </tr>
          <tr>
            <th scope="row">MÃ¡quina</th>
            <td>001</td>
          </tr>
          <tr>
            <th scope="row">Local</th>
            <td>LaboratÃ³rio 1</td>
          </tr>
          <tr>
            <th scope="row">Categoria</th>
            <td>NÃ£o liga</td>
          </tr>
          <tr>
            <th scope="row">DescriÃ§Ã£o</th>
            <td>Ao pressionar o botÃ£o de ligar, nÃ£o hÃ¡ resposta alguma da mÃ¡quina.</td>
          </tr>
        </tbody>
      </table>
      <h5>OperaÃ§Ãµes realizadas</h5>
      Nenhuma operaÃ§Ã£o foi realizada atÃ© o momento.
      <br>
      <div style="margin-top: 15px;" class="d-grid gap-2 d-md-flex justify-content-md-end">
        <button type="button" class="btn btn-secondary disabled">Avaliar Chamado</button>
        <button class="btn btn-danger" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">Acessar Chat</button>

      <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
        <div class="offcanvas-header">
          <h5 class="offcanvas-title" id="offcanvasRightLabel">Chat</h5>
          <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            Nenhuma mensagem foi enviada atÃ© o momento.
            <div class="input-group mb-3 fixed-bottom" style="padding-left: calc(100% - 390px); padding-right: 10px;">
                <input type="text" class="form-control" placeholder="Digite sua mensagem..." aria-label="Recipient's username" aria-describedby="button-addon2">
                <button class="btn btn-outline-secondary" type="button" id="button-addon2">Enviar</button>
            </div>
        </div>
        </div>
      </div>
    </div>
  </main>

  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
    integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
    integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
  </script>
</body>

</html>