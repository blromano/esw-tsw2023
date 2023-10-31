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
import chamaweb.entidades.Estado;


/**
 *
 * @author bv3018229
 */
public class EstadoDAO extends DAO<Estado> {

    public EstadoDAO() throws SQLException {
    }
    
    @Override
    public void salvar( Estado obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "INSERT INTO " + 
                "estados( EST_NOME ) " + 
                "VALUES( ? );");

        stmt.setString( 1, obj.getNome() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public void atualizar( Estado obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "UPDATE estados " + 
                "SET" + 
                "    EST_NOME = ? " + 
                "WHERE" + 
                "    EST_ID = ?;" );

        stmt.setString( 1, obj.getNome() );
        stmt.setInt( 2, obj.getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public void excluir( Estado obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "DELETE FROM estados " + 
                "WHERE" + 
                "    EST_ID = ?;" );

        stmt.setInt( 1, obj.getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public List<Estado> listarTodos() throws SQLException {

        List<Estado> lista = new ArrayList<>();

        PreparedStatement stmt = getConnection().prepareStatement(
                "SELECT" + 
                "    EST_ID, " + 
                "    EST_NOME " + 
                "FROM" + 
                "    estados " + 
                "ORDER BY EST_NOME;" );

        ResultSet rs = stmt.executeQuery();

        while ( rs.next() ) {

            Estado estado = new Estado();

            estado.setId( rs.getInt( "EST_ID" ) );
            estado.setNome( rs.getString( "EST_NOME" ) );

            lista.add( estado );

        }

        rs.close();
        stmt.close();

        return lista;

    }

    @Override
    public Estado obterPorId( int id ) throws SQLException {

        Estado estado = null;

        PreparedStatement stmt = getConnection().prepareStatement(
                "SELECT" + 
                "    EST_ID, " + 
                "    EST_NOME " + 
                "FROM" + 
                "    estados " +
                "WHERE EST_ID = ? " +
                "ORDER BY EST_NOME;" );

        stmt.setInt( 1, id );

        ResultSet rs = stmt.executeQuery();

        if ( rs.next() ) {

            estado = new Estado();

            estado.setId( rs.getInt( "EST_ID" ) );
            estado.setNome( rs.getString( "EST_NOME" ) );

        }

        rs.close();
        stmt.close();

        return estado;

    }    
}
