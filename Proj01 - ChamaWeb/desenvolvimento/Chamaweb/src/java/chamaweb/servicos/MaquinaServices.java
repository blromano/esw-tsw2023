package chamaweb.servicos;

import chamaweb.dao.MaquinaDAO;
import chamaweb.entidades.Maquina;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gabryel
 */
public class MaquinaServices {

    /**
     * Usa o MaquinaDAO para obter todos os estados.
     *
     * @return Lista de estados.
     */
    public List<Maquina> getTodos() {

        List<Maquina> lista = new ArrayList<>();
        MaquinaDAO dao = null;

        try {
            dao = new MaquinaDAO();
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
