<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="en">

<head>
  <title>Editar Chamado</title>
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

    <script src="${cp}/js/libs/jquery/jquery.min.js"></script>
    <script src="${cp}/js/libs/decimal.js/decimal.min.js"></script>
    <script src="${cp}/js/formularios/operacoes/editarChamado.js"></script>

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
    <div class="card col-sm-7" style="min-width: 450px; margin: auto auto; margin-top: 5vh; padding: 15px ; outline: 1px lightgray solid; border-radius: 5px;"">
      <form action="${cp}/processaChamados" method="POST">
        <input type="hidden" name="acao" value="alterar">
        <input type="hidden" name="idUsuarioAtual" value="${requestScope.idUsuarioAtual}" />
        <input type="hidden" name="tipoUsuarioAtual" value="${requestScope.tipoUsuarioAtual}" />
        <input type="hidden" name="id" value="${requestScope.chamado.id}">
        <input type="hidden" name="usuario" value="${requestScope.chamado.usuario.id}">
        <input type="hidden" id="hiddenOperacoes" name="operacoes"/>
        <h5>Chamado #${requestScope.chamado.id}</h5>
        <table class="table table-striped">
          <tbody style="vertical-align: middle;">
            <tr>
              <th scope="row">Tí­tulo</th>
              <td><input type="text" class="form-control" id="floatingID" placeholder = "Título" value="${requestScope.chamado.titulo}" required name="titulo"></td>
            </tr>
            <tr>
              <th scope="row">Estado</th>
              <td>
                <select class="form-select" id="floatingState" name="estado">
                  <jsp:useBean id="servicosEst" class="chamaweb.servicos.EstadoServices" scope="page"/>
                  <c:forEach var="estado" items="${servicosEst.todos}">
                    <c:choose>
                      <c:when test="${estado.id == requestScope.chamado.estado.id}">
                        <option value="${estado.id}" selected>${estado.nome}</option>
                      </c:when>
                      <c:otherwise>
                        <option value="${estado.id}">${estado.nome}</option>
                      </c:otherwise>
                    </c:choose>
                  </c:forEach>
                </select>
              </td>
            </tr>
            <tr>
              <th scope="row">Prioridade</th>
              <td>
                <select class="form-select" id="floatingState" name="prioridade">
                  <jsp:useBean id="servicosPri" class="chamaweb.servicos.PrioridadeServices" scope="page"/>
                  <c:forEach var="prioridade" items="${servicosPri.todos}">
                    <c:choose>
                      <c:when test="${prioridade.id == requestScope.chamado.prioridade.id}">
                        <option value="${prioridade.id}" selected>${prioridade.nome}</option>
                      </c:when>
                      <c:otherwise>
                        <option value="${prioridade.id}">${prioridade.nome}</option>
                      </c:otherwise>
                    </c:choose>
                  </c:forEach>
                </select>
              </td>
            </tr>
            <tr>
              <th scope="row">Data</th>
              <td><input type="date" name="data" class="form-control" id="floatingID" placeholder = "Tí­tulo" value="${requestScope.chamado.data}" required></td>
            </tr>
            <tr>
              <th scope="row">Usuário</th>
              <td>${requestScope.chamado.usuario.nome}</td>
            </tr>
            <tr>
              <th scope="row">Técnico</th>
              <td>
                <select class="form-select" id="floatingState" name="tecnico">
                  <jsp:useBean id="servicosUsr" class="chamaweb.servicos.UsuarioServices" scope="page"/>
                  <c:forEach var="tecnico" items="${servicosUsr.todos}">
                    <c:choose>
                      <c:when test="${tecnico.tipo.id == 1}">
                        <c:choose>
                          <c:when test="${tecnico.id == requestScope.chamado.tecnico.id}">
                            <option value="${tecnico.id}" selected>${tecnico.nome}</option>
                          </c:when>
                          <c:otherwise>
                            <option value="${tecnico.id}">${tecnico.nome}</option>
                          </c:otherwise>
                        </c:choose>
                      </c:when>
                    </c:choose>
                  </c:forEach>
                </select>
              </td>
            </tr>
            <tr>
              <th scope="row">Máquina</th>
              <td><select class="form-select" id="floatingState" name="maquina">
                <jsp:useBean id="servicosMaq" class="chamaweb.servicos.MaquinaServices" scope="page"/>
                <c:forEach var="maquina" items="${servicosMaq.todos}">
                  <c:choose>
                    <c:when test="${maquina.id == requestScope.chamado.maquina.id}">
                      <option value="${maquina.id}" selected>${maquina.id} - ${maquina.marca} ${maquina.modelo}</option>
                    </c:when>
                    <c:otherwise>
                      <option value="${maquina.id}">${maquina.id} - ${maquina.marca} ${maquina.modelo}</option>
                    </c:otherwise>
                  </c:choose>
                </c:forEach>
              </select></td>
            </tr>
            <tr>
              <th scope="row">Local</th>
              <td>
                ${requestScope.chamado.maquina.laboratorio.id} - ${requestScope.chamado.maquina.laboratorio.nome}
              </td>
            </tr>
            <tr>
              <th scope="row">Categoria</th>
              <td><select class="form-select" id="floatingState" name="categoria">
                <jsp:useBean id="servicosCat" class="chamaweb.servicos.CategoriaServices" scope="page"/>
                <c:forEach var="categoria" items="${servicosCat.todos}">
                  <c:choose>
                    <c:when test="${categoria.ativo == 1}">
                      <c:choose>
                        <c:when test="${categoria.id == requestScope.chamado.categoria.id}">
                          <option value="${categoria.id}" selected>${categoria.nome}</option>
                        </c:when>
                        <c:otherwise>
                          <option value="${categoria.id}">${categoria.nome}</option>
                        </c:otherwise>
                      </c:choose>
                    </c:when>
                  </c:choose>
                </c:forEach>
              </select></td>
            </tr>
            <tr>
              <th scope="row">Descrição</th>
              <td>${requestScope.chamado.descricao}</td>
            </tr>
          </tbody>
        </table>
        <h5>Operações realizadas</h5>
        <table class="table table-striped" id="opTable" name="opTable">
          <jsp:useBean id="servicosO" class="chamaweb.servicos.OperacaoServices" />
            <c:forEach items="${servicosO.todos}" var="operacao">
              <c:choose>
                <c:when test="${operacao.chamado.id == requestScope.chamado.id}">
                  <tr>
                    <td>${operacao.usuario.nome}</td>
                    <td><fmt:formatDate 
                      pattern="dd/MM/yyyy"
                      value="${operacao.data}"/></td>
                    <td>${operacao.descricao}</td>
                  </tr>
                </c:when>
              </c:choose>
            </c:forEach>
          </table>
        <div class="input-group mb-3">
          <input type="text" data-username="${usuario.nome}" class="form-control" placeholder = "Operações realizadas" value="" id="newOperacao" name="newOperacao">
          <input type="button" class="btn btn-primary" value="+" id="btnInserir" name="btnInserir" />
        </div>
        <br>
        <div class="d-grid gap-2 d-md-inline">
          <div class="d-grid gap-2 d-md-inline float-end">
            <button class="btn btn-primary" type="submit" >Salvar Alterações</button>
              <form action="${cp}/processaChamados" method="POST">
                <input type="hidden" name="acao" value="prepararListagemTecnico" />
                <input type="hidden" name="idUsuarioAtual" value="${requestScope.idUsuarioAtual}" />
                <input type="hidden" name="tipoUsuarioAtual" value="${requestScope.tipoUsuarioAtual}" />
                <button class="btn btn-secondary" type="submit">Cancelar</button>
            </form>
          </div>
        </form>
        <form action="${cp}/processaChamados" method="POST">
          <input type="hidden" name="acao" value="excluir" />
          <input type="hidden" name="id" value="${requestScope.chamado.id}">
          <input type="hidden" name="usuario" value="${requestScope.chamado.usuario.id}">
          <input type="hidden" name="idUsuarioAtual" value="${requestScope.idUsuarioAtual}" />
          <input type="hidden" name="tipoUsuarioAtual" value="${requestScope.tipoUsuarioAtual}" />
          <button class="btn btn-danger float-start" type="submit">Excluir Chamado</button>
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