package chamaweb.controladores;

import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import chamaweb.dao.UsuarioDAO;
import chamaweb.entidades.Usuario;
import chamaweb.utils.Utils;

@WebServlet( name = "UsuariosServlet", 
             urlPatterns = { "/processaUsuarios" } )
public class UsuariosServlet extends HttpServlet {

    protected void processRequest( 
            HttpServletRequest request, 
            HttpServletResponse response )
            throws ServletException, IOException {
        
        String acao = request.getParameter( "acao" );
        RequestDispatcher disp = null;

        try {
            
                UsuarioDAO dao = new UsuarioDAO();
                String matricula = request.getParameter( "matricula" );
                String senha = request.getParameter( "senha" );

                Usuario usuarioFornecido = new Usuario();
                usuarioFornecido.setMatricula( matricula );
                usuarioFornecido.setSenha( senha );

                Usuario u = dao.obterPorMatricula( matricula );
                
                if (u == null) {
                    request.setAttribute( "erro",  "Matricula não encontrada!");
                    disp = request.getRequestDispatcher("/index.jsp" );
                } else if (!u.getSenha().equals(usuarioFornecido.getSenha())) {
                    request.setAttribute( "erro",  "Senha Incorreta!");
                    disp = request.getRequestDispatcher("/index.jsp" );
                } else {
                    disp = request.getRequestDispatcher("/chamado/meusChamados.jsp" );
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
        return "UsuariosServlet";
    }

}
