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
import chamaweb.entidades.Tipo;


/**
 *
 * @author bv3018229
 */
public class TipoDAO extends DAO<Tipo> {

    public TipoDAO() throws SQLException {
    }
    
    @Override
    public void salvar( Tipo obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "INSERT INTO " + 
                "tipos( TIP_NOME ) " + 
                "VALUES( ? );");

        stmt.setString( 1, obj.getNome() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public void atualizar( Tipo obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "UPDATE tipos " + 
                "SET" + 
                "    TIP_NOME = ? " + 
                "WHERE" + 
                "    TIP_ID = ?;" );

        stmt.setString( 1, obj.getNome() );
        stmt.setInt( 2, obj.getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public void excluir( Tipo obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "DELETE FROM tipos " + 
                "WHERE" + 
                "    TIP_ID = ?;" );

        stmt.setInt( 1, obj.getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public List<Tipo> listarTodos() throws SQLException {

        List<Tipo> lista = new ArrayList<>();

        PreparedStatement stmt = getConnection().prepareStatement(
                "SELECT" + 
                "    TIP_ID, " + 
                "    TIP_NOME " + 
                "FROM" + 
                "    tipos " + 
                "ORDER BY TIP_NOME;" );

        ResultSet rs = stmt.executeQuery();

        while ( rs.next() ) {

            Tipo tipo = new Tipo();

            tipo.setId( rs.getInt( "TIP_ID" ) );
            tipo.setNome( rs.getString( "TIP_NOME" ) );

            lista.add( tipo );

        }

        rs.close();
        stmt.close();

        return lista;

    }

    @Override
    public Tipo obterPorId( int id ) throws SQLException {

        Tipo tipo = null;

        PreparedStatement stmt = getConnection().prepareStatement(
                "SELECT" + 
                "    TIP_ID, " + 
                "    TIP_NOME " + 
                "FROM" + 
                "    tipos " +
                "WHERE TIP_ID = ? " +
                "ORDER BY TIP_NOME;" );

        stmt.setInt( 1, id );

        ResultSet rs = stmt.executeQuery();

        if ( rs.next() ) {

            tipo = new Tipo();

            tipo.setId( rs.getInt( "TIP_ID" ) );
            tipo.setNome( rs.getString( "TIP_NOME" ) );

        }

        rs.close();
        stmt.close();

        return tipo;

    }    
}
