package chamaweb.servicos;

import chamaweb.dao.CategoriaDAO;
import chamaweb.entidades.Categoria;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gabryel
 */
public class CategoriaServices {

    /**
     * Usa o CategoriaDAO para obter todos os estados.
     *
     * @return Lista de estados.
     */
    public List<Categoria> getTodos() {

        List<Categoria> lista = new ArrayList<>();
        CategoriaDAO dao = null;

        try {
            dao = new CategoriaDAO();
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
