package chamaweb.servicos;

import chamaweb.dao.ChamadoDAO;
import chamaweb.entidades.Chamado;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author gurma
 */
public class ChamadoServices {

    /**
     * Usa o ChamadoDAO para obter todos os estados.
     *
     * @return Lista de estados.
     */
    public List<Chamado> getTodos() {

        List<Chamado> lista = new ArrayList<>();
        ChamadoDAO dao = null;

        try {
            dao = new ChamadoDAO();
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
