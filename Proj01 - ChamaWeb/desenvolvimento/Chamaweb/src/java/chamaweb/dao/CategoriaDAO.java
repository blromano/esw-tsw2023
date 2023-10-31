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
import chamaweb.utils.Utils;
import chamaweb.entidades.Categoria;


/**
 *
 * @author bv3018229
 */
public class CategoriaDAO extends DAO<Categoria> {

    public CategoriaDAO() throws SQLException {
    }
    
    
    
    @Override
    public void salvar( Categoria obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "INSERT INTO " + 
                "categorias( CAT_NOME, CAT_ATIVO) " + 
                "VALUES( ?, 1 );");

        stmt.setString( 1, obj.getNome() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public void atualizar( Categoria obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "UPDATE categorias " + 
                "SET" + 
                "    CAT_NOME = ?," + 
                "    CAT_ATIVO = ? " + 
                "WHERE" + 
                "    CAT_ID = ?;" );

        stmt.setString( 1, obj.getNome() );
        stmt.setLong( 2, obj.getAtivo() );
        stmt.setLong( 3, obj.getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public void excluir( Categoria obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "DELETE FROM categorias " + 
                "WHERE" + 
                "    CAT_ID = ?;" );

        stmt.setLong( 1, obj.getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public List<Categoria> listarTodos() throws SQLException {

        List<Categoria> lista = new ArrayList<>();

        PreparedStatement stmt = getConnection().prepareStatement(
                "SELECT" + 
                "    CAT_ID, " + 
                "    CAT_NOME " + 
                "FROM" + 
                "    categorias " + 
                "ORDER BY CAT_NOME;" );

        ResultSet rs = stmt.executeQuery();

        while ( rs.next() ) {

            Categoria cat = new Categoria();

            cat.setId( rs.getInt( "CAT_ID" ) );
            cat.setNome( rs.getString( "CAT_NOME" ) );

            lista.add( cat );

        }

        rs.close();
        stmt.close();

        return lista;

    }

    @Override
    public Categoria obterPorId( int id ) throws SQLException {

        Categoria cat = null;

        PreparedStatement stmt = getConnection().prepareStatement(
                "SELECT" + 
                "    CAT_ID, " + 
                "    CAT_NOME " + 
                "FROM" + 
                "    categorias " +
                "WHERE CAT_ID = ? " +
                "ORDER BY CAT_NOME;" );

        stmt.setLong( 1, id );

        ResultSet rs = stmt.executeQuery();

        if ( rs.next() ) {

            cat = new Categoria();

            cat.setId( rs.getInt( "CAT_ID" ) );
            cat.setNome( rs.getString( "CAT_NOME" ) );

        }

        rs.close();
        stmt.close();

        return cat;

    }    
}
