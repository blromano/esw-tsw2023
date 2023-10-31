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
import chamaweb.dao.MaquinaDAO;
import chamaweb.entidades.Laboratorio;
import chamaweb.entidades.Maquina;
import chamaweb.utils.Utils;

/**
 * Servlet para tratar Maquinas.
 *
 * @author Prof. Dr. David Buzatto
 */
@WebServlet( name = "MaquinasServlet", 
             urlPatterns = { "/processaMaquinas" } )
public class MaquinasServlet extends HttpServlet {

    protected void processRequest( 
            HttpServletRequest request, 
            HttpServletResponse response )
            throws ServletException, IOException {
        
        String acao = request.getParameter( "acao" );
        RequestDispatcher disp = null;

        try {

            MaquinaDAO dao = new MaquinaDAO();
            LaboratorioDAO daoLab = new LaboratorioDAO();

            if ( acao.equals( "inserir" ) ) {

                String marca = request.getParameter( "marca" );
                String modelo = request.getParameter( "modelo" );
                String processador = request.getParameter( "processador" );
                String ram = request.getParameter( "ram" );
                String os = request.getParameter( "os" );
                Laboratorio l = daoLab.obterPorId( Integer.parseInt( request.getParameter( "laboratorio" ) ) );

                Maquina m = new Maquina();
                m.setMarca( marca );
                m.setModelo( modelo );
                m.setProcessador( processador );
                m.setRam( ram );
                m.setOs( os );
                m.setLaboratorio( l );

                dao.salvar( m );
                disp = request.getRequestDispatcher(
                        "maquina/listagemMaquinas.jsp" );

            } else if ( acao.equals( "alterar" ) ) {
                
                int id = Integer.parseInt(request.getParameter( "id" ));
                String marca = request.getParameter( "marca" );
                String modelo = request.getParameter( "modelo" );
                String processador = request.getParameter( "processador" );
                String ram = request.getParameter( "ram" );
                String os = request.getParameter( "os" );
                int ativo = Integer.parseInt(request.getParameter( "ativo" ));
                Laboratorio l = daoLab.obterPorId( Integer.parseInt( request.getParameter( "laboratorio" ) ) );

                Maquina m = new Maquina();
                m.setId( id );
                m.setMarca( marca );
                m.setModelo( modelo );
                m.setProcessador( processador );
                m.setRam( ram );
                m.setOs( os );
                m.setAtivo( ativo );
                m.setLaboratorio( l );

                dao.atualizar( m );
                disp = request.getRequestDispatcher(
                        "maquina/listagemMaquinas.jsp" );

            } else if ( acao.equals( "ativar" ) ) {
                
                int id = Integer.parseInt(request.getParameter( "id" ));
                int ativo = Integer.parseInt(request.getParameter( "ativo" ));
                if( ativo == 0 ) {
                    ativo = 1;
                } else {
                    ativo = 0;
                }

                Maquina m = dao.obterPorId( id );
                m.setAtivo( ativo );

                dao.atualizar( m );
                disp = request.getRequestDispatcher(
                        "maquina/listagemMaquinas.jsp" );

            } else {
                
                int id = Integer.parseInt(request.getParameter( "id" ));
                Maquina m = dao.obterPorId( id );
                request.setAttribute( "maquina", m );
                
                if ( acao.equals( "prepararAlteracao" ) ) {
                    disp = request.getRequestDispatcher( 
                            "maquina/editarMaquina.jsp" );
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
        return "MaquinasServlet";
    }

}
