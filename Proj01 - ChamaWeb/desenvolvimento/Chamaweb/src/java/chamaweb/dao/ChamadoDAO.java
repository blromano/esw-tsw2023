/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package chamaweb.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import chamaweb.entidades.Categoria;
import chamaweb.entidades.Chamado;
import chamaweb.entidades.Estado;
import chamaweb.entidades.Laboratorio;
import chamaweb.entidades.Maquina;
import chamaweb.entidades.Prioridade;
import chamaweb.entidades.Tipo;
import chamaweb.entidades.Usuario;

public class ChamadoDAO extends DAO<Chamado> {

    public ChamadoDAO() throws SQLException {
    }
    
    @Override
    public void salvar( Chamado obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "INSERT INTO " + 
                "chamados( CHA_TITULO, CHA_DATA, CHA_DESCRICAO, CHA_RESULTADO_AVALIACAO, CHA_OBSERVACOES_AVALIACAO, FK_MAQUINAS_MAQ_ID, FK_USUARIOS_USR_ID, FK_CATEGORIAS_CAT_ID, FK_ESTADOS_EST_ID) " + 
                "VALUES( ?, ?, ?, ?, ?, ?, ?, ?, ? );");

        stmt.setString( 1, obj.getTitulo() );
        stmt.setDate( 2, obj.getData() );
        stmt.setString( 3, obj.getDescricao() );
        stmt.setBoolean( 4, obj.getResultadoAvaliacao() );
        stmt.setString( 5, obj.getObservacoesAvaliacao() );
        stmt.setInt( 6, obj.getMaquina().getId() );
        stmt.setInt( 7, obj.getUsuario().getId() );
        stmt.setInt( 8, obj.getCategoria().getId() );
        stmt.setInt( 9, obj.getEstado().getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public void atualizar( Chamado obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "UPDATE chamados " + 
                "SET" + 
                "    CHA_TITULO = ?," + 
                "    CHA_DATA = ?," + 
                //"    CHA_DESCRICAO = ?," + 
                "    FK_MAQUINAS_MAQ_ID = ?," + 
                "    FK_USUARIOS_USR_ID = ?," + 
                "    FK_USUARIOS_USR_ID_TECNICO = ?," + 
                "    FK_CATEGORIAS_CAT_ID = ?," + 
                "    FK_PRIORIDADES_PRI_ID = ?," + 
                "    FK_ESTADOS_EST_ID = ? " + 
                "WHERE" + 
                "    CHA_ID = ?;" );

        stmt.setString( 1, obj.getTitulo() );
        stmt.setDate( 2, obj.getData() );
        //stmt.setString( 3, obj.getDescricao() );
        stmt.setInt( 3, obj.getMaquina().getId() );
        stmt.setInt( 4, obj.getUsuario().getId() );
        stmt.setInt( 5, obj.getTecnico().getId() );
        stmt.setInt( 6, obj.getCategoria().getId() );
        stmt.setInt( 7, obj.getPrioridade().getId() );
        stmt.setInt( 8, obj.getEstado().getId() );
        stmt.setInt( 9, obj.getId() );

        System.out.println( stmt.toString());

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public void excluir( Chamado obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "DELETE FROM chamados " + 
                "WHERE" + 
                "    CHA_ID = ?;" );

        stmt.setInt( 1, obj.getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public List<Chamado> listarTodos() throws SQLException {

        List<Chamado> lista = new ArrayList<>();

        PreparedStatement stmt = getConnection().prepareStatement(
                "SELECT" + 
                "    * " + 
                "FROM" + 
                "    chamados " +
                "INNER JOIN maquinas ON maquinas.MAQ_ID = chamados.FK_MAQUINAS_MAQ_ID " +
                "INNER JOIN usuarios usuario ON usuario.USR_ID = chamados.FK_USUARIOS_USR_ID " +
                "LEFT JOIN usuarios tecnico ON tecnico.USR_ID = chamados.FK_USUARIOS_USR_ID_TECNICO " +
                "INNER JOIN categorias ON categorias.CAT_ID = chamados.FK_CATEGORIAS_CAT_ID " +
                "LEFT JOIN prioridades ON prioridades.PRI_ID = chamados.FK_PRIORIDADES_PRI_ID " +
                "INNER JOIN estados ON estados.EST_ID = chamados.FK_ESTADOS_EST_ID " +
                "INNER JOIN laboratorios ON laboratorios.LAB_ID = maquinas.FK_LABORATORIOS_LAB_ID " +
                "INNER JOIN tipos tipoUsuario ON tipoUsuario.TIP_ID = usuario.FK_TIPOS_TIP_ID " +
                "LEFT JOIN tipos tipoTecnico ON tipoTecnico.TIP_ID = tecnico.FK_TIPOS_TIP_ID " +
                "ORDER BY CHA_TITULO;" );

        ResultSet rs = stmt.executeQuery();

        while ( rs.next() ) {

            Chamado chamado = new Chamado();
            Laboratorio laboratorio = new Laboratorio();
            Maquina maquina = new Maquina();
            Tipo tipoUsuario = new Tipo();
            Usuario usuario = new Usuario();
            Tipo tipoTecnico = new Tipo();
            Usuario tecnico = new Usuario();
            Categoria categoria = new Categoria();
            Prioridade prioridade = new Prioridade();
            Estado estado = new Estado();

            laboratorio.setId( rs.getInt( "LAB_ID" ) );
            laboratorio.setNome( rs.getString( "LAB_NOME" ) );
            laboratorio.setAtivo( rs.getInt( "LAB_ATIVO" ) );

            maquina.setId( rs.getInt( "MAQ_ID" ) );
            maquina.setMarca( rs.getString( "MAQ_MARCA" ) );
            maquina.setModelo( rs.getString( "MAQ_MODELO" ) );
            maquina.setProcessador( rs.getString( "MAQ_PROCESSADOR" ) );
            maquina.setRam( rs.getString( "MAQ_RAM" ) );
            maquina.setOs( rs.getString( "MAQ_OS" ) );
            maquina.setAtivo( rs.getInt( "MAQ_ATIVO" ) );
            maquina.setLaboratorio( laboratorio );

            tipoUsuario.setId( rs.getInt( "tipoUsuario.TIP_ID" ) );
            tipoUsuario.setNome( rs.getString( "tipoUsuario.TIP_NOME" ) );

            usuario.setId( rs.getInt( "usuario.USR_ID" ) );
            usuario.setNome( rs.getString( "usuario.USR_NOME" ) );
            usuario.setMatricula( rs.getString( "usuario.USR_MATRICULA" ) );
            usuario.setSenha( rs.getString( "usuario.USR_SENHA" ) );
            usuario.setTipo( tipoUsuario );

            if ( rs.getInt( "tecnico.USR_ID" ) == 0 ) {
                tecnico = null;
            }else{
                tipoTecnico.setId( rs.getInt( "tipoTecnico.TIP_ID" ) );
                tipoTecnico.setNome( rs.getString( "tipoTecnico.TIP_NOME" ) );

                tecnico.setId( rs.getInt( "tecnico.USR_ID" ) );
                tecnico.setNome( rs.getString( "tecnico.USR_NOME" ) );
                tecnico.setMatricula( rs.getString( "tecnico.USR_MATRICULA" ) );
                tecnico.setSenha( rs.getString( "tecnico.USR_SENHA" ) );
                tecnico.setTipo( tipoTecnico );
            }

            categoria.setId( rs.getInt( "CAT_ID" ) );
            categoria.setNome( rs.getString( "CAT_NOME" ) );
            categoria.setAtivo( rs.getInt( "CAT_ATIVO" ) );

            if ( rs.getInt( "PRI_ID" ) == 0 ) {
                prioridade = null;
            }else{
                prioridade.setId( rs.getInt( "PRI_ID" ) );
                prioridade.setNome( rs.getString( "PRI_NOME" ) );
            }
            
            estado.setId( rs.getInt( "EST_ID" ) );
            estado.setNome( rs.getString( "EST_NOME" ) );

            chamado.setId( rs.getInt( "CHA_ID" ) );
            chamado.setTitulo( rs.getString( "CHA_TITULO" ) );
            chamado.setData( rs.getDate( "CHA_DATA" ) );
            chamado.setDescricao( rs.getString( "CHA_DESCRICAO" ) );
            chamado.setResultadoAvaliacao( rs.getBoolean( "CHA_RESULTADO_AVALIACAO" ) );
            chamado.setObservacoesAvaliacao( rs.getString( "CHA_OBSERVACOES_AVALIACAO" ) );
            chamado.setMaquina( maquina );
            chamado.setUsuario( usuario );
            chamado.setTecnico( tecnico );
            chamado.setCategoria( categoria );
            chamado.setPrioridade( prioridade );
            chamado.setEstado( estado );

            lista.add( chamado );

        }

        rs.close();
        stmt.close();

        return lista;

    }

    @Override
    public Chamado obterPorId( int id ) throws SQLException {

        Chamado chamado = null;

        PreparedStatement stmt = getConnection().prepareStatement(
                "SELECT" + 
                "    * " + 
                "FROM" + 
                "    chamados " +
                "INNER JOIN maquinas ON maquinas.MAQ_ID = chamados.FK_MAQUINAS_MAQ_ID " +
                "INNER JOIN usuarios usuario ON usuario.USR_ID = chamados.FK_USUARIOS_USR_ID " +
                "LEFT JOIN usuarios tecnico ON tecnico.USR_ID = chamados.FK_USUARIOS_USR_ID_TECNICO " +
                "INNER JOIN categorias ON categorias.CAT_ID = chamados.FK_CATEGORIAS_CAT_ID " +
                "LEFT JOIN prioridades ON prioridades.PRI_ID = chamados.FK_PRIORIDADES_PRI_ID " +
                "INNER JOIN estados ON estados.EST_ID = chamados.FK_ESTADOS_EST_ID " +
                "INNER JOIN laboratorios ON laboratorios.LAB_ID = maquinas.FK_LABORATORIOS_LAB_ID " +
                "INNER JOIN tipos tipoUsuario ON tipoUsuario.TIP_ID = usuario.FK_TIPOS_TIP_ID " +
                "LEFT JOIN tipos tipoTecnico ON tipoTecnico.TIP_ID = tecnico.FK_TIPOS_TIP_ID " +
                "WHERE CHA_ID = ? " +
                "ORDER BY CHA_TITULO;" );

        stmt.setInt( 1, id );

        ResultSet rs = stmt.executeQuery();

        if ( rs.next() ) {

            chamado = new Chamado();
            Laboratorio laboratorio = new Laboratorio();
            Maquina maquina = new Maquina();
            Tipo tipoUsuario = new Tipo();
            Usuario usuario = new Usuario();
            Tipo tipoTecnico = new Tipo();
            Usuario tecnico = new Usuario();
            Categoria categoria = new Categoria();
            Prioridade prioridade = new Prioridade();
            Estado estado = new Estado();

            laboratorio.setId( rs.getInt( "LAB_ID" ) );
            laboratorio.setNome( rs.getString( "LAB_NOME" ) );
            laboratorio.setAtivo( rs.getInt( "LAB_ATIVO" ) );

            maquina.setId( rs.getInt( "MAQ_ID" ) );
            maquina.setMarca( rs.getString( "MAQ_MARCA" ) );
            maquina.setModelo( rs.getString( "MAQ_MODELO" ) );
            maquina.setProcessador( rs.getString( "MAQ_PROCESSADOR" ) );
            maquina.setRam( rs.getString( "MAQ_RAM" ) );
            maquina.setOs( rs.getString( "MAQ_OS" ) );
            maquina.setAtivo( rs.getInt( "MAQ_ATIVO" ) );
            maquina.setLaboratorio( laboratorio );

            tipoUsuario.setId( rs.getInt( "TIP_ID" ) );
            tipoUsuario.setNome( rs.getString( "TIP_NOME" ) );

            usuario.setId( rs.getInt( "USR_ID" ) );
            usuario.setNome( rs.getString( "USR_NOME" ) );
            usuario.setMatricula( rs.getString( "USR_MATRICULA" ) );
            usuario.setSenha( rs.getString( "USR_SENHA" ) );
            usuario.setTipo( tipoUsuario );

            tipoTecnico.setId( rs.getInt( "TIP_ID" ) );
            tipoTecnico.setNome( rs.getString( "TIP_NOME" ) );

            tecnico.setId( rs.getInt( "USR_ID" ) );
            tecnico.setNome( rs.getString( "USR_NOME" ) );
            tecnico.setMatricula( rs.getString( "USR_MATRICULA" ) );
            tecnico.setSenha( rs.getString( "USR_SENHA" ) );
            tecnico.setTipo( tipoTecnico );

            categoria.setId( rs.getInt( "CAT_ID" ) );
            categoria.setNome( rs.getString( "CAT_NOME" ) );
            categoria.setAtivo( rs.getInt( "CAT_ATIVO" ) );

            prioridade.setId( rs.getInt( "PRI_ID" ) );
            prioridade.setNome( rs.getString( "PRI_NOME" ) );
            
            estado.setId( rs.getInt( "EST_ID" ) );
            estado.setNome( rs.getString( "EST_NOME" ) );

            chamado.setId( rs.getInt( "CHA_ID" ) );
            chamado.setTitulo( rs.getString( "CHA_TITULO" ) );
            chamado.setData( rs.getDate( "CHA_DATA" ) );
            chamado.setDescricao( rs.getString( "CHA_DESCRICAO" ) );
            chamado.setResultadoAvaliacao( rs.getBoolean( "CHA_RESULTADO_AVALIACAO" ) );
            chamado.setObservacoesAvaliacao( rs.getString( "CHA_OBSERVACOES_AVALIACAO" ) );
            chamado.setMaquina( maquina );
            chamado.setUsuario( usuario );
            chamado.setTecnico( tecnico );
            chamado.setCategoria( categoria );
            chamado.setPrioridade( prioridade );
            chamado.setEstado( estado );
            
        }

        rs.close();
        stmt.close();

        return chamado;

    }    
}
