package chamaweb.servicos;

import chamaweb.dao.LaboratorioDAO;
import chamaweb.entidades.Laboratorio;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gabryel
 */
public class LaboratorioServices {

    /**
     * Usa o LaboratorioDAO para obter todos os estados.
     *
     * @return Lista de estados.
     */
    public List<Laboratorio> getTodos() {

        List<Laboratorio> lista = new ArrayList<>();
        LaboratorioDAO dao = null;

        try {
            dao = new LaboratorioDAO();
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
