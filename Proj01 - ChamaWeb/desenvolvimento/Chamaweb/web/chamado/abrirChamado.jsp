<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="en">

<head>
  <title>Abrir Chamado</title>
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
    <div class="card col-sm-3" style="min-width: 400px; margin: auto auto; margin-top: 5vh; padding: 15px ; outline: 1px lightgray solid; border-radius: 5px;"">
      <form action="${cp}/processaChamados" method="POST">
      <input type="hidden" name="acao" value="inserir">
      <h5>Abrir Chamado</h5>  
      <div class="card-body">
        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="floatingTitle" name="titulo" placeholder = "Titulo do chamado" required>
            <label for="floatingTitle">Titulo do Chamado</label>
          </div>
          <div class="form-floating mb-3">
            <select name="maquina" class="form-select">
              <option selected></option>
              <jsp:useBean id="servicosMaq" class="chamaweb.servicos.MaquinaServices" scope="page"/>
              <c:forEach var="maquina" items="${servicosMaq.todos}">
                <option value="${maquina.id}">${maquina.id} - ${maquina.marca} ${maquina.modelo}</option>
              </c:forEach>
            </select>
            <label for="floatingProblem">ID da máquina</label>
          </div>
          <div class="form-floating mb-3">
            <select name="categoria" class="form-select">
              <option selected></option>
              <jsp:useBean id="servicosCat" class="chamaweb.servicos.CategoriaServices" scope="page"/>
              <c:forEach var="categoria" items="${servicosCat.todos}">
                <option value="${categoria.id}">${categoria.nome}</option>
              </c:forEach>
            </select>
            <label for="floatingProblem">Categoria do problema</label>
          </div>
          <div class="form-floating mb-3">
            <textarea name="descricao" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
            <label for="exampleFormControlTextarea1" class="form-label">Descrição do problema</label>
          </div>
        </div>
        <button type="submit" value="inserir" class="btn btn-primary">Enviar</button>
      </form>
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