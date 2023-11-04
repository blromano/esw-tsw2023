<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div class="card col-sm-7" style="min-width: 450px; margin: auto auto; margin-top: 5vh; padding: 15px ; outline: 1px lightgray solid; border-radius: 5px;"">
      <form action="${cp}/processaChamados" method="POST">
        <input type="hidden" name="acao" value="alterar">
        <input type="hidden" name="id" value="${requestScope.chamado.id}">
        <input type="hidden" name="usuario" value="${requestScope.chamado.usuario.id}">
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
              <td><input type="text" name="data" class="form-control" id="floatingID" placeholder = "Tí­tulo" value="${requestScope.chamado.data}" required></td>
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
                  <c:forEach var="usuario" items="${servicosUsr.todos}">
                    <c:choose>
                      <c:when test="${usuario.tipo.id == requestScope.chamado.tecnico.tipo.id}">
                        <c:choose>
                          <c:when test="${usuario.id == requestScope.chamado.tecnico.id}">
                            <option value="${usuario.id}" selected>${usuario.nome}</option>
                          </c:when>
                          <c:otherwise>
                            <option value="${usuario.id}">${usuario.nome}</option>
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
              <td><select class="form-select" id="floatingState" name="laboratorio">
                <jsp:useBean id="servicosLab" class="chamaweb.servicos.LaboratorioServices" scope="page"/>
                <c:forEach var="laboratorio" items="${servicosLab.todos}">
                  <c:choose>
                    <c:when test="${laboratorio.ativo == 1}">
                      <c:choose>
                        <c:when test="${laboratorio.id == requestScope.chamado.maquina.laboratorio.id}">
                          <option value="${laboratorio.id}" selected>${laboratorio.id} - ${laboratorio.nome}</option>
                        </c:when>
                        <c:otherwise>
                          <option value="${laboratorio.id}">${laboratorio.id} - ${laboratorio.nome}</option>
                        </c:otherwise>
                      </c:choose>
                    </c:when>
                  </c:choose>
                </c:forEach>
              </select></td>
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
        <!--TODO: Adicionar operações realizadas no valor-->
        <input type="text" class="form-control" id="floatingID" placeholder = "Operações realizadas" value="" required name="operacoes">
        <br>
        <div class="d-grid gap-2 d-md-inline">
          <div class="d-grid gap-2 d-md-inline float-end">
            <button class="btn btn-primary" type="submit" >Salvar Alterações</button>
            <button class="btn btn-secondary" type="button" >Cancelar</button>
          </div>
        </form>
          <button class="btn btn-danger float-start" type="submit">Excluir Chamado</button>
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