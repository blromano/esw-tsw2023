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
    <div class="card col-sm-8" style="min-width: 400px; margin: auto auto; margin-top: 5vh; padding: 15px ; outline: 1px lightgray solid; border-radius: 5px;"">
      <h5>Chamado #${requestScope.chamado.id}</h5>
      <table class="table table-striped">
        <tbody style="vertical-align: middle;">
          <tr>
            <th scope="row">Título</th>
            <td>${requestScope.chamado.titulo}</td>
          </tr>
          <tr>
            <th scope="row">Estado</th>
            <td>${requestScope.chamado.estado.nome}</td>
          </tr>
          <tr>
            <th scope="row">Data</th>
            <td>${requestScope.chamado.data}</td>
          </tr>
          <tr>
            <th scope="row">Usuário</th>
            <td>${requestScope.chamado.usuario.nome}</td>
          </tr>
          <tr>
            <th scope="row">Técnico</th>
            <td>${requestScope.chamado.tecnico.nome}</td>
          </tr>
          <tr>
            <th scope="row">Máquina</th>
            <td>${requestScope.chamado.maquina.id} - ${requestScope.chamado.maquina.marca} ${requestScope.chamado.maquina.modelo}</td>
          </tr>
          <tr>
            <th scope="row">Local</th>
            <td>${requestScope.chamado.maquina.laboratorio.nome}</td>
          </tr>
          <tr>
            <th scope="row">Categoria</th>
            <td>${requestScope.chamado.categoria.nome}</td>
          </tr>
          <tr>
            <th scope="row">Descrição</th>
            <td>${requestScope.chamado.descricao}</td>
          </tr>
        </tbody>
      </table>
      <h5>Operações realizadas</h5>
      
      <br>
      <div style="margin-top: 15px;" class="d-grid gap-2 d-md-flex justify-content-md-end">
        <c:choose>
          <c:when test="${requestScope.chamado.estado.id == 3}">
            <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#modalAvaliacao${chamado.id}">Avaliar Chamado</button>
          </c:when>
          <c:otherwise>
            <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#modalAvaliacao${chamado.id}" disabled>Avaliar Chamado</button>
          </c:otherwise>
        </c:choose>
                                        <!-- Modal -->
    <div class="modal fade" id="modalAvaliacao${chamado.id}" tabindex="-1" role="dialog" aria-labelledby="modalAvaliacao${chamado.id}Label" aria-hidden="true">
     <div class="modal-dialog" role="document">
      <div class="modal-content">
       <div class="modal-header">
        <h5 class="modal-title" id="modalAvaliacao${chamado.id}Label" style="color: black;" >Avaliar Chamado</h5>
        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="${cp}/processaChamados" method="post">
          <input type="hidden" name="acao" value="avaliar">
          <input type="hidden" name="idUsuarioAtual" value="${requestScope.idUsuarioAtual}" />
          <input type="hidden" name="tipoUsuarioAtual" value="${requestScope.tipoUsuarioAtual}" />
          <input type="hidden" name="id" value="${chamado.id}">
          <div class="row">
            <div class="col-12">
              <label for="resultadoAvaliacao" class="form-label">O problema foi resolvido?</label>
            </div>
            <div class="col-12">
              <input type="radio" class="btn-check" name="resultadoAvaliacao" id="success-outlined" autocomplete="off" value="true">
              <label class="btn btn-outline-success" for="success-outlined">Sim</label>

              <input type="radio" class="btn-check" name="resultadoAvaliacao" id="danger-outlined" autocomplete="off" value="false">
              <label class="btn btn-outline-secondary" for="danger-outlined">Não</label>
            </div>
            <div class="col-12">
              <label for="observacoesAvaliacao" class="form-label">Observações</label>
              <textarea class="form-control" id="observacoesAvaliacao" name="observacoesAvaliacao" rows="3"></textarea>
            </div>              
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
          <input type="submit" class="btn btn-dark" value="Enviar">
        </div>
      </form>
    </div>
  </div>
</div>
        <button class="btn btn-danger" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">Acessar Chat</button>

      <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
        <div class="offcanvas-header">
          <h5 class="offcanvas-title" id="offcanvasRightLabel">Chat</h5>
          <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            Nenhuma mensagem foi enviada até o momento.
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