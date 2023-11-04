package chamaweb.servicos;

import chamaweb.dao.PrioridadeDAO;
import chamaweb.entidades.Prioridade;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gabryel
 */
public class PrioridadeServices {

    /**
     * Usa o PrioridadeDAO para obter todos os prioridades.
     *
     * @return Lista de prioridades.
     */
    public List<Prioridade> getTodos() {

        List<Prioridade> lista = new ArrayList<>();
        PrioridadeDAO dao = null;

        try {
            dao = new PrioridadeDAO();
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
