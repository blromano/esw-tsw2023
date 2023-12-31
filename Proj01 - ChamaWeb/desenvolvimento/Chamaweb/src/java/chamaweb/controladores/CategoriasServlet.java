package chamaweb.controladores;

import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import chamaweb.dao.CategoriaDAO;
import chamaweb.entidades.Categoria;
import chamaweb.utils.Utils;

/**
 * Servlet para tratar Categorias.
 *
 * @author Prof. Dr. David Buzatto
 */
@WebServlet( name = "CategoriasServlet", 
             urlPatterns = { "/processaCategorias" } )
public class CategoriasServlet extends HttpServlet {

    protected void processRequest( 
            HttpServletRequest request, 
            HttpServletResponse response )
            throws ServletException, IOException {
        
        String acao = request.getParameter( "acao" );
        request.setAttribute( "idUsuarioAtual",  request.getParameter( "idUsuarioAtual" ));
        request.setAttribute( "tipoUsuarioAtual",  request.getParameter( "tipoUsuarioAtual" ));
        RequestDispatcher disp = null;

        try ( CategoriaDAO dao = new CategoriaDAO() ){

            if ( acao.equals( "inserir" ) ) {

                String nome = request.getParameter( "nome" );

                Categoria c = new Categoria();
                c.setNome( nome );

                dao.salvar( c );
                disp = request.getRequestDispatcher(
                        "problema/listagemProblemas.jsp" );

            } else if ( acao.equals( "alterar" ) ) {

                int id = Integer.parseInt(request.getParameter( "id" ));
                String nome = request.getParameter( "nome" );
                int ativo = Integer.parseInt(request.getParameter( "ativo" ));

                Categoria c = dao.obterPorId( id );
                c.setNome( nome );
                c.setAtivo( ativo );

                dao.atualizar( c );
                disp = request.getRequestDispatcher(
                        "problema/listagemProblemas.jsp" );

            } else if ( acao.equals( "ativar" ) ) {
                
                int id = Integer.parseInt(request.getParameter( "id" ));
                int ativo = Integer.parseInt(request.getParameter( "ativo" ));
                if( ativo == 0 ) {
                    ativo = 1;
                } else {
                    ativo = 0;
                }

                Categoria c = dao.obterPorId( id );
                c.setAtivo( ativo );

                dao.atualizar( c );
                disp = request.getRequestDispatcher(
                        "problema/listagemProblemas.jsp" );

            } else if ( acao.equals("prepararListagem") ) {

                disp = request.getRequestDispatcher( 
                        "problema/listagemProblemas.jsp" );

            } else if (acao.equals("prepararInsercao")) {

                disp = request.getRequestDispatcher( 
                        "problema/cadastroProblema.jsp" );

            } else {
                
                int id = Integer.parseInt(request.getParameter( "id" ));
                Categoria c = dao.obterPorId( id );
                request.setAttribute( "categoria", c );
                
                if ( acao.equals( "prepararAlteracao" ) ) {
                    disp = request.getRequestDispatcher( 
                            "problema/editarProblema.jsp" );
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
        return "CategoriasServlet";
    }

}
