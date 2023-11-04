package chamaweb.servicos;

import chamaweb.dao.UsuarioDAO;
import chamaweb.entidades.Usuario;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gabryel
 */
public class UsuarioServices {

    /**
     * Usa o UsuarioDAO para obter todos os usuarios.
     *
     * @return Lista de usuarios.
     */
    public List<Usuario> getTodos() {

        List<Usuario> lista = new ArrayList<>();
        UsuarioDAO dao = null;

        try {
            dao = new UsuarioDAO();
            lista = dao.listarTodos();
        } catch ( SQLException exc ) {
            exc.printStackTrace();
        } finally {
            if ( dao != null ) {
                try {
                    dao.close();
                } catch ( SQLException exc ) {
                    exc.printStackTrace();
                }
            }
        }

        return lista;

    }

}
