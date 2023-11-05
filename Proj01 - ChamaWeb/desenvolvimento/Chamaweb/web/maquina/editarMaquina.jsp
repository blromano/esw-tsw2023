<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="en">

<head>
  <title>Editar Máquina</title>
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
            <a class="navbar-brand" href="${cp}/index.jsp">
                <!--<img src="src/chamaweb.png" alt="" height="50" class="d-inline-block align-text-top">-->
                Chamaweb
              </a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <form action="${cp}/processaChamados" method="POST">
                  <input type="hidden" name="acao" value="prepararListagemUsuario" />
                  <input type="hidden" name="idUsuarioAtual" value="${requestScope.idUsuarioAtual}" />
                  <input type="hidden" name="tipoUsuarioAtual" value="${requestScope.tipoUsuarioAtual}" />
                  <button class="btn btn-link" type="submit">Meus Chamados</button>
                </form>
              </li>
              <c:choose>
                <c:when test="${requestScope.tipoUsuarioAtual == 1}">
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      Técnico
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                      <h6 class="dropdown-header">Listagens</h6>
                      <li><form action="${cp}/processaMaquinas" method="POST">
                        <input type="hidden" name="acao" value="prepararListagem" />
                        <input type="hidden" name="idUsuarioAtual" value="${requestScope.idUsuarioAtual}" />
                        <input type="hidden" name="tipoUsuarioAtual" value="${requestScope.tipoUsuarioAtual}" />
                        <input class="dropdown-item" type="submit" value="Máquinas">
                        </form>
                      </li>
                      <li><form action="${cp}/processaChamados" method="POST">
                        <input type="hidden" name="acao" value="prepararListagemTecnico" />
                        <input type="hidden" name="idUsuarioAtual" value="${requestScope.idUsuarioAtual}" />
                        <input type="hidden" name="tipoUsuarioAtual" value="${requestScope.tipoUsuarioAtual}" />
                        <input class="dropdown-item" type="submit" value="Chamados">
                        </form>
                      </li>
                      <li>
                        <form action="${cp}/processaLaboratorios" method="POST">
                          <input type="hidden" name="acao" value="prepararListagem" />
                          <input type="hidden" name="idUsuarioAtual" value="${requestScope.idUsuarioAtual}" />
                          <input type="hidden" name="tipoUsuarioAtual" value="${requestScope.tipoUsuarioAtual}" />
                          <input class="dropdown-item" type="submit" value="Laboratórios">
                        </form>
                      </li>
                      <li>
                        <form action="${cp}/processaCategorias" method="POST">
                          <input type="hidden" name="acao" value="prepararListagem" />
                          <input type="hidden" name="idUsuarioAtual" value="${requestScope.idUsuarioAtual}" />
                          <input type="hidden" name="tipoUsuarioAtual" value="${requestScope.tipoUsuarioAtual}" />
                          <input class="dropdown-item" type="submit" value="Categorias de Problemas">
                        </form>
                      </li>
                    </ul>
                  </li>
                </c:when>
              </c:choose>
            </ul>
            <form action="${cp}/processaChamados" method="POST">
              <input type="hidden" name="acao" value="prepararInsercao" />
              <input type="hidden" name="idUsuarioAtual" value="${requestScope.idUsuarioAtual}" />
              <input type="hidden" name="tipoUsuarioAtual" value="${requestScope.tipoUsuarioAtual}" />
              <button class="btn btn-danger" type="submit">Abrir Chamado</button>
            </form>
          </div>
        </div>
      </nav>
  </header>
  <main>
    <div class="card col-sm-7" style="min-width: 400px; margin: auto auto; margin-top: 5vh; padding: 15px ; outline: 1px lightgray solid; border-radius: 5px;"">
      <form action="${cp}/processaMaquinas" method="POST">
      <input name="acao" type="hidden" value="alterar"/>
      <input type="hidden" name="idUsuarioAtual" value="${requestScope.idUsuarioAtual}" />
      <input type="hidden" name="tipoUsuarioAtual" value="${requestScope.tipoUsuarioAtual}" />
      <input name="ativo" type="hidden" value="${requestScope.maquina.ativo}"/>
      <input name="id" type="hidden" value="${requestScope.maquina.id}"/>
      <h5>Máquina #${requestScope.maquina.id}</h5>
      <table class="table table-striped">
        <tbody style="vertical-align: middle;">
          <tr>
            <th scope="row">Local</th>
            <td><select class="form-select" id="laboratorio" name="laboratorio">
              <jsp:useBean id="servicosLab" class="chamaweb.servicos.LaboratorioServices" scope="page"/>
              <c:forEach items="${servicosLab.todos}" var="laboratorio">
                <c:choose>
                    <c:when test="${laboratorio.id eq requestScope.maquina.laboratorio.id}">
                      <option value="${laboratorio.id}" selected>${laboratorio.nome}</option>
                    </c:when>
                    <c:otherwise>
                      <option value="${laboratorio.id}">${laboratorio.nome}</option>
                    </c:otherwise>
                </c:choose>
              </c:forEach>
            </select></td>
          </tr>
          <tr>
            <th scope="row">Marca</th>
            <td><input type="text" class="form-control" id="marca" name="marca" placeholder = "Marca da Máquina" value="${requestScope.maquina.marca}" required></td>
          </tr>
          <tr>
            <th scope="row">Modelo</th>
            <td><input type="text" class="form-control" id="modelo" name="modelo" placeholder = "Modelo da Máquina" value="${requestScope.maquina.modelo}" required></td>
          </tr>
          <tr>
            <th scope="row">Processador</th>
            <td><input type="text" class="form-control" id="processador" name="processador" placeholder = "Processador da Máquina" value="${requestScope.maquina.processador}" required></td>
          </tr>
          <tr>
            <th scope="row">RAM</th>
            <td><input type="text" class="form-control" id="ram" name="ram" placeholder = "Quantidade de Memória RAM" value="${requestScope.maquina.ram}" required></td>
          </tr>
          <tr>
            <th scope="row">SO</th>
            <td><input type="text" class="form-control" id="os" name="os" placeholder = "Sistema Operacional" value="${requestScope.maquina.os}" required></td>
          </tr>
        </tbody>
      </table>
      <div class="d-grid gap-2 d-md-inline">
        <div class="d-grid gap-2 d-md-inline float-end">
          <button class="btn btn-primary" type="submit" value="alterar">Salvar Alterações</button>
          <form action="${cp}/processaMaquinas" method="POST">
            <input type="hidden" name="acao" value="prepararListagem" />
            <input type="hidden" name="idUsuarioAtual" value="${requestScope.idUsuarioAtual}" />
            <input type="hidden" name="tipoUsuarioAtual" value="${requestScope.tipoUsuarioAtual}" />
            <button class="btn btn-secondary" type="submit">Cancelar</button>
          </form>
        </div>
      </form>
      <form action="${cp}/processaMaquinas" method="POST">
        <input name="id" type="hidden" value="${requestScope.maquina.id}"/>
        <input name="acao" type="hidden" value="ativar"/>
        <input type="hidden" name="idUsuarioAtual" value="${requestScope.idUsuarioAtual}" />
        <input type="hidden" name="tipoUsuarioAtual" value="${requestScope.tipoUsuarioAtual}" />
        <input name="ativo" type="hidden" value="${requestScope.maquina.ativo}"/>
        <button class="btn btn-danger float-start" type="submit" value="ativar">
          <c:choose>
            <c:when test="${requestScope.maquina.ativo == 1}">
              Desativar Máquina
            </c:when>
            <c:otherwise>
              Ativar Máquina
            </c:otherwise>
          </c:choose>
        </button>
      </form>
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