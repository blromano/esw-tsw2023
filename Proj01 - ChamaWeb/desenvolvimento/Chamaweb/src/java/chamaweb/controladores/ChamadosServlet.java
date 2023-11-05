package chamaweb.controladores;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import chamaweb.dao.CategoriaDAO;
import chamaweb.dao.ChamadoDAO;
import chamaweb.dao.EstadoDAO;
import chamaweb.dao.MaquinaDAO;
import chamaweb.dao.OperacaoDAO;
import chamaweb.dao.PrioridadeDAO;
import chamaweb.dao.UsuarioDAO;
import chamaweb.entidades.Categoria;
import chamaweb.entidades.Chamado;
import chamaweb.entidades.Estado;
import chamaweb.entidades.Maquina;
import chamaweb.entidades.Operacao;
import chamaweb.entidades.Prioridade;
import chamaweb.entidades.Usuario;
import chamaweb.utils.Utils;
import jakarta.json.Json;
import jakarta.json.JsonArray;
import jakarta.json.JsonObject;
import jakarta.json.JsonReader;
import jakarta.json.JsonValue;
import java.io.StringReader;

/**
 * Servlet para tratar Chamados.
 *
 * @author Prof. Dr. David Buzatto
 */
@WebServlet( name = "ChamadosServlet", 
             urlPatterns = { "/processaChamados" } )
public class ChamadosServlet extends HttpServlet {

    protected void processRequest( 
            HttpServletRequest request, 
            HttpServletResponse response )
            throws ServletException, IOException {
        
        String acao = request.getParameter( "acao" );
        int idUsuarioAtual = Integer.parseInt(request.getParameter( "idUsuarioAtual" ));
        request.setAttribute( "idUsuarioAtual",  request.getParameter( "idUsuarioAtual" ));
        request.setAttribute( "tipoUsuarioAtual",  request.getParameter( "tipoUsuarioAtual" ));
        RequestDispatcher disp = null;

        try {

            ChamadoDAO dao = new ChamadoDAO();
            MaquinaDAO daoMaq = new MaquinaDAO();
            UsuarioDAO daoUsr = new UsuarioDAO();
            CategoriaDAO daoCat = new CategoriaDAO();
            PrioridadeDAO daoPri = new PrioridadeDAO();
            EstadoDAO daoEst = new EstadoDAO();
            OperacaoDAO daoOpe = new OperacaoDAO();

            if ( acao.equals( "inserir" ) ) {

                String titulo = request.getParameter( "titulo" );
                String descricao = request.getParameter( "descricao" );
                Maquina maquina = daoMaq.obterPorId( Integer.parseInt( request.getParameter( "maquina" ) ) );
                //TODO: substituir com o ID do usuario logado
                Usuario usuario = daoUsr.obterPorId(Integer.parseInt( request.getParameter( "usuario" ) ));
                Categoria categoria = daoCat.obterPorId( Integer.parseInt( request.getParameter( "categoria" ) ) );
                Estado estado = daoEst.obterPorId( 1 );
                String data = new Date(System.currentTimeMillis()).toString();

                Chamado chamado = new Chamado();
                chamado.setTitulo( titulo );
                chamado.setData( Date.valueOf(LocalDate.parse(data)));
                chamado.setDescricao( descricao );
                chamado.setMaquina( maquina );
                chamado.setUsuario( usuario );
                chamado.setCategoria( categoria );
                chamado.setEstado( estado );

                dao.salvar( chamado );
                disp = request.getRequestDispatcher(
                        "chamado/meusChamados.jsp" );

            } else if ( acao.equals( "alterar" ) ) {
                int id = Integer.parseInt(request.getParameter( "id" ));
                String titulo = request.getParameter( "titulo" );
                String data = request.getParameter( "data" );
                String descricao = request.getParameter( "descricao" );
                Maquina maquina = daoMaq.obterPorId( Integer.parseInt( request.getParameter( "maquina" ) ) );
                Usuario usuario = daoUsr.obterPorId( Integer.parseInt( request.getParameter( "usuario" ) ) );
                Usuario tecnico = daoUsr.obterPorId( Integer.parseInt( request.getParameter( "tecnico" ) ) );
                Categoria categoria = daoCat.obterPorId( Integer.parseInt( request.getParameter( "categoria" ) ) );
                Prioridade prioridade = daoPri.obterPorId( Integer.parseInt( request.getParameter( "prioridade" ) ) );
                Estado estado = daoEst.obterPorId( Integer.parseInt( request.getParameter( "estado" ) ) );
                String operacoes = request.getParameter( "operacoes" );
                Usuario usuarioLogado = daoUsr.obterPorId( idUsuarioAtual );

                System.out.println(operacoes);

                Chamado chamado = new Chamado();
                chamado.setId( id );
                chamado.setTitulo( titulo );
                chamado.setData( Date.valueOf(LocalDate.parse(data)) );
                chamado.setDescricao( descricao );
                chamado.setMaquina( maquina );
                chamado.setUsuario( usuario );
                chamado.setTecnico( tecnico );
                chamado.setCategoria( categoria );
                chamado.setPrioridade( prioridade );
                chamado.setEstado( estado );

                dao.atualizar( chamado );

                if (operacoes != null && !operacoes.isEmpty()) {

                    JsonReader jsr = Json.createReader(new StringReader(operacoes));

                    JsonArray ja = jsr.readArray();

                    for ( JsonValue jsv : ja ) {
                        JsonObject jo = jsv.asJsonObject();

                        String descricaoOperacao = jo.getString( "descricao" );
                        Date dataOperacao = Date.valueOf(jo.getString( "data" ));
                        Operacao operacao = new Operacao();
                        operacao.setDescricao( descricaoOperacao );
                        operacao.setData( dataOperacao );
                        operacao.setChamado( chamado ); 
                        operacao.setUsuario( usuarioLogado );
                        daoOpe.salvar(operacao);
                    }
                }

                disp = request.getRequestDispatcher(
                        "chamado/listagemChamados.jsp" );
            } else if ( acao.equals( "avaliar" ) ) {
                
                int id = Integer.parseInt(request.getParameter( "id" ));

                Chamado chamado = dao.obterPorId( id );

                chamado.setResultadoAvaliacao( Boolean.parseBoolean(request.getParameter( "resultadoAvaliacao" )) );
                chamado.setObservacoesAvaliacao( request.getParameter( "observacoesAvaliacao" ) );

                dao.avaliar(chamado);

                disp = request.getRequestDispatcher(
                        "chamado/meusChamados.jsp" );
            } else if ( acao.equals( "excluir" ) ) {
                int id = Integer.parseInt(request.getParameter( "id" ));
                Chamado chamado = dao.obterPorId( id );
                dao.excluir( chamado );
                disp = request.getRequestDispatcher(
                        "chamado/listagemChamados.jsp" );
            } else if (acao.equals("prepararListagemUsuario")) {

                disp = request.getRequestDispatcher( 
                        "chamado/meusChamados.jsp" );

            } 
            else if (acao.equals("prepararListagemTecnico")) {

                disp = request.getRequestDispatcher( 
                        "chamado/listagemChamados.jsp" );

            } else {
                Usuario usuario = daoUsr.obterPorId( idUsuarioAtual );
                request.setAttribute( "usuario", usuario );

                if ( acao.equals( "prepararInsercao" ) ) {
                    disp = request.getRequestDispatcher( 
                            "chamado/abrirChamado.jsp" );
                } 
                
                if ( acao.equals( "prepararAcesso" ) ) {
                    int id = Integer.parseInt(request.getParameter( "id" ));
                    Chamado chamado = dao.obterPorId( id );
                    request.setAttribute( "chamado", chamado );
                    
                    disp = request.getRequestDispatcher( 
                            "chamado/acessarChamado.jsp" );
                }

                if ( acao.equals( "prepararAlteracao" ) ) {
                    int id = Integer.parseInt(request.getParameter( "id" ));
                    Chamado chamado = dao.obterPorId( id );
                    request.setAttribute( "chamado", chamado );
                    disp = request.getRequestDispatcher( 
                            "chamado/editarChamado.jsp" );
                } 
                
            }

        } catch ( SQLException exc ) {
            disp = Utils.prepararDespachoErro( request, exc.getMessage() );
        }

        if ( disp != null ) {
            disp.forward( request, response );
        }
        
    }

    @Override
    protected void doGet( 
            HttpServletRequest request, 
            HttpServletResponse response )
            throws ServletException, IOException {
        processRequest( request, response );
    }

    @Override
    protected void doPost( 
            HttpServletRequest request, 
            HttpServletResponse response )
            throws ServletException, IOException {
        processRequest( request, response );
    }

    @Override
    public String getServletInfo() {
        return "ChamadosServlet";
    }

}
