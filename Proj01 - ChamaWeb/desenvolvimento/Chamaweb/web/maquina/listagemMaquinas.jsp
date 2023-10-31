<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="en">

<head>
  <title>Máquinas</title>
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
    <div class="card col-sm-8" style="min-width: 650px; margin: auto auto; margin-top: 5vh; padding: 15px ; outline: 1px lightgray solid; border-radius: 5px;"">
        <table class="table table-striped">
          <thead style="text-align: center;">
            <th colspan="9">Listagem de Maquinas</th>
          </thead>
          <thead>
            <tr>
              <th scope="col">ID</th>
              <th scope="col">Laboratório</th>
              <th scope="col">Marca</th>
              <th scope="col">Modelo</th>
              <th scope="col">Processador</th>
              <th scope="col">RAM</th>
              <th scope="col">SO</th>
              <th scope="col">Status</th>
              <th scope="col">Editar</th>
            </tr>
          <tbody>
            <jsp:useBean id="servicos" class="chamaweb.servicos.MaquinaServices" />
            <c:forEach items="${servicos.todos}" var="maquina">
              <tr>
                <td>${maquina.id}</td>
                <td>${maquina.laboratorio.nome}</td>
                <td>${maquina.marca}</td>
                <td>${maquina.modelo}</td>
                <td>${maquina.processador}</td>
                <td>${maquina.ram}</td>
                <td>${maquina.os}</td>
                <td> 
                  <c:choose>
                    <c:when test="${maquina.ativo == 1}">
                      Ativo
                    </c:when>
                    <c:otherwise>
                      Inativo
                    </c:otherwise>
                  </c:choose>
                </td>
                <td style="text-align: right; padding-right:20px;"> 
                    <a class="link-light" href="${cp}/processaMaquinas?acao=prepararAlteracao&id=${maquina.id}" >Editar</a>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
        <button type="button" class="btn btn-primary" onclick="window.open('${cp}/maquina/cadastroMaquina.jsp', '_self')">Cadastrar Máquina</button>
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