package chamaweb.controladores;

import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import chamaweb.dao.LaboratorioDAO;
import chamaweb.entidades.Laboratorio;
import chamaweb.utils.Utils;

/**
 * Servlet para tratar Laboratorios.
 *
 * @author Prof. Dr. David Buzatto
 */
@WebServlet( name = "LaboratoriosServlet", 
             urlPatterns = { "/processaLaboratorios" } )
public class LaboratoriosServlet extends HttpServlet {

    protected void processRequest( 
            HttpServletRequest request, 
            HttpServletResponse response )
            throws ServletException, IOException {
        
        String acao = request.getParameter( "acao" );
        RequestDispatcher disp = null;

        try ( LaboratorioDAO dao = new LaboratorioDAO() ){

            if ( acao.equals( "inserir" ) ) {

                String nome = request.getParameter( "nome" );

                Laboratorio l = new Laboratorio();
                l.setNome( nome );

                dao.salvar( l );
                disp = request.getRequestDispatcher(
                        "laboratorio/listagemLaboratorios.jsp" );

            } else if ( acao.equals( "alterar" ) ) {

                int id = Integer.parseInt(request.getParameter( "id" ));
                String nome = request.getParameter( "nome" );
                int ativo = Integer.parseInt(request.getParameter( "ativo" ));

                Laboratorio l = dao.obterPorId( id );
                l.setNome( nome );
                l.setAtivo( ativo );

                dao.atualizar( l );
                disp = request.getRequestDispatcher(
                        "laboratorio/listagemLaboratorios.jsp" );

            } else if ( acao.equals( "ativar" ) ) {
                
                int id = Integer.parseInt(request.getParameter( "id" ));
                int ativo = Integer.parseInt(request.getParameter( "ativo" ));
                if( ativo == 0 ) {
                    ativo = 1;
                } else {
                    ativo = 0;
                }

                Laboratorio l = dao.obterPorId( id );
                l.setAtivo( ativo );

                dao.atualizar( l );
                disp = request.getRequestDispatcher(
                        "laboratorio/listagemLaboratorios.jsp" );

            } else {
                
                int id = Integer.parseInt(request.getParameter( "id" ));
                Laboratorio l = dao.obterPorId( id );
                request.setAttribute( "laboratorio", l );
                
                if ( acao.equals( "prepararAlteracao" ) ) {
                    disp = request.getRequestDispatcher( 
                            "laboratorio/editarLaboratorio.jsp" );
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
        return "LaboratoriosServlet";
    }

}
