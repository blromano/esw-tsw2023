package chamaweb.servicos;

import chamaweb.dao.OperacaoDAO;
import chamaweb.entidades.Operacao;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Gabryel
 */
public class OperacoesServices {

    /**
     * Usa o OperacaoDAO para obter todos os estados.
     *
     * @return Lista de estados.
     */
    public List<Operacao> getTodos() {

        List<Operacao> lista = new ArrayList<>();
        OperacaoDAO dao = null;

        try {
            dao = new OperacaoDAO();
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
