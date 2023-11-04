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
import chamaweb.entidades.Prioridade;


/**
 *
 * @author bv3018229
 */
public class PrioridadeDAO extends DAO<Prioridade> {

    public PrioridadeDAO() throws SQLException {
    }
    
    @Override
    public void salvar( Prioridade obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "INSERT INTO " + 
                "prioridades( PRI_NOME ) " + 
                "VALUES( ? );");

        stmt.setString( 1, obj.getNome() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public void atualizar( Prioridade obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "UPDATE prioridades " + 
                "SET" + 
                "    PRI_NOME = ? " + 
                "WHERE" + 
                "    PRI_ID = ?;" );

        stmt.setString( 1, obj.getNome() );
        stmt.setInt( 2, obj.getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public void excluir( Prioridade obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "DELETE FROM prioridades " + 
                "WHERE" + 
                "    PRI_ID = ?;" );

        stmt.setInt( 1, obj.getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public List<Prioridade> listarTodos() throws SQLException {

        List<Prioridade> lista = new ArrayList<>();

        PreparedStatement stmt = getConnection().prepareStatement(
                "SELECT" + 
                "    PRI_ID, " + 
                "    PRI_NOME " + 
                "FROM" + 
                "    prioridades " +
                "ORDER BY PRI_ID" );

        ResultSet rs = stmt.executeQuery();

        while ( rs.next() ) {

            Prioridade prioridade = new Prioridade();

            prioridade.setId( rs.getInt( "PRI_ID" ) );
            prioridade.setNome( rs.getString( "PRI_NOME" ) );

            lista.add( prioridade );

        }

        rs.close();
        stmt.close();

        return lista;

    }

    @Override
    public Prioridade obterPorId( int id ) throws SQLException {

        Prioridade prioridade = null;

        PreparedStatement stmt = getConnection().prepareStatement(
                "SELECT" + 
                "    PRI_ID, " + 
                "    PRI_NOME " + 
                "FROM" + 
                "    prioridades " +
                "WHERE PRI_ID = ? " );

        stmt.setInt( 1, id );

        ResultSet rs = stmt.executeQuery();

        if ( rs.next() ) {

            prioridade = new Prioridade();

            prioridade.setId( rs.getInt( "PRI_ID" ) );
            prioridade.setNome( rs.getString( "PRI_NOME" ) );

        }

        rs.close();
        stmt.close();

        return prioridade;

    }    
}
