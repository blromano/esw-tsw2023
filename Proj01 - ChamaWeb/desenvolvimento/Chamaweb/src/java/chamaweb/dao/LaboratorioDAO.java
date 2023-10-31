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
import chamaweb.entidades.Laboratorio;


/**
 *
 * @author bv3018229
 */
public class LaboratorioDAO extends DAO<Laboratorio> {

    public LaboratorioDAO() throws SQLException {
    }
    
    
    
    @Override
    public void salvar( Laboratorio obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "INSERT INTO " + 
                "laboratorios( LAB_NOME, LAB_ATIVO) " + 
                "VALUES( ?, 1 );");

        stmt.setString( 1, obj.getNome() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public void atualizar( Laboratorio obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "UPDATE laboratorios " + 
                "SET" + 
                "    LAB_NOME = ?," + 
                "    LAB_ATIVO = ? " + 
                "WHERE" + 
                "    LAB_ID = ?;" );

        stmt.setString( 1, obj.getNome() );
        stmt.setInt( 2, obj.getAtivo() );
        stmt.setInt( 3, obj.getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public void excluir( Laboratorio obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "DELETE FROM laboratorios " + 
                "WHERE" + 
                "    LAB_ID = ?;" );

        stmt.setInt( 1, obj.getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public List<Laboratorio> listarTodos() throws SQLException {

        List<Laboratorio> lista = new ArrayList<>();

        PreparedStatement stmt = getConnection().prepareStatement(
                "SELECT" + 
                "    LAB_ID, " + 
                "    LAB_NOME, " + 
                "    LAB_ATIVO " +
                "FROM" + 
                "    laboratorios " + 
                "ORDER BY LAB_NOME;" );

        ResultSet rs = stmt.executeQuery();

        while ( rs.next() ) {

            Laboratorio lab = new Laboratorio();

            lab.setId( rs.getInt( "LAB_ID" ) );
            lab.setNome( rs.getString( "LAB_NOME" ) );
            lab.setAtivo( rs.getInt( "LAB_ATIVO" ) );

            lista.add( lab );

        }

        rs.close();
        stmt.close();

        return lista;

    }

    @Override
    public Laboratorio obterPorId( int id ) throws SQLException {

        Laboratorio lab = null;

        PreparedStatement stmt = getConnection().prepareStatement(
                "SELECT" + 
                "    LAB_ID, " + 
                "    LAB_NOME, " + 
                "    LAB_ATIVO " + 
                "FROM" + 
                "    laboratorios " +
                "WHERE LAB_ID = ? " +
                "ORDER BY LAB_NOME;" );

        stmt.setInt( 1, id );

        ResultSet rs = stmt.executeQuery();

        if ( rs.next() ) {

            lab = new Laboratorio();

            lab.setId( rs.getInt( "LAB_ID" ) );
            lab.setNome( rs.getString( "LAB_NOME" ) );
            lab.setAtivo( rs.getInt( "LAB_ATIVO" ) );

        }

        rs.close();
        stmt.close();

        return lab;

    }    
}
