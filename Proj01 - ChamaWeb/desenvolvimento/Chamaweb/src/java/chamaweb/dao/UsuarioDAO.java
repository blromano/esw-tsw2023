/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package chamaweb.dao;

import chamaweb.entidades.Tipo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import chamaweb.utils.Utils;
import chamaweb.entidades.Usuario;


/**
 *
 * @author bv3018229
 */
public class UsuarioDAO extends DAO<Usuario>{

    public UsuarioDAO() throws SQLException {
    }
    
    @Override
    public void salvar( Usuario obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "INSERT INTO " + 
                "usuarios( USR_MATRICULA, USR_SENHA, USR_EMAIL, USR_NOME, FK_TIPOS_TIP_ID) " + 
                "VALUES( ?, ?, ?, ?, ? );" );

        stmt.setString( 1, obj.getMatricula() );
        stmt.setString( 2, obj.getSenha() );
        stmt.setString( 3, obj.getEmail() );
        stmt.setString( 4, obj.getNome() );
        stmt.setInt( 5, obj.getTipo().getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public void atualizar( Usuario obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "UPDATE usuarios " + 
                "SET" +
                "    USR_MATRICULA = ?, "+
                "    USR_SENHA = ?, " +
                "    USR_EMAIL = ?, " + 
                "    USR_NOME = ?, " + 
                "    FK_TIPOS_TIP_ID = ?" +
                "WHERE" + 
                "    USR_ID = ?;" );

        stmt.setString( 1, obj.getMatricula() );
        stmt.setString( 2, obj.getSenha() );
        stmt.setString( 3, obj.getEmail() );
        stmt.setString( 4, obj.getNome() );
        stmt.setInt( 5, obj.getTipo().getId() );
        stmt.setInt( 6, obj.getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public void excluir( Usuario obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "DELETE FROM usuarios " + 
                "WHERE" + 
                "    USR_ID = ?;" );

        stmt.setInt( 1, obj.getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public List<Usuario> listarTodos() throws SQLException {

        List<Usuario> lista = new ArrayList<>();

        PreparedStatement stmt = getConnection().prepareStatement(
                "SELECT * FROM usuarios " + 
                "INNER JOIN tipos ON FK_TIPOS_TIP_ID = TIP_ID " +
                "ORDER BY USR_NOME;" );

        ResultSet rs = stmt.executeQuery();

        while ( rs.next() ) {

            Usuario usr = new Usuario();
            Tipo tip = new Tipo();

            usr.setId( rs.getInt( "USR_ID" ) );
            usr.setNome( rs.getString( "USR_NOME" ) );
            usr.setSenha( rs.getString("USR_SENHA") );
            usr.setEmail( rs.getString("USR_EMAIL") );
            usr.setMatricula( rs.getString("USR_MATRICULA") );

            tip.setId( rs.getInt( "TIP_ID" ));
            tip.setNome( rs.getString( "TIP_NOME" ));

            usr.setTipo( tip );
            
            lista.add( usr );

        }

        rs.close();
        stmt.close();

        return lista;

    }

    @Override
    public Usuario obterPorId( int id ) throws SQLException {

        Usuario usr = null;

        PreparedStatement stmt = getConnection().prepareStatement(
                "SELECT * FROM usuarios " + 
                "INNER JOIN tipos ON FK_TIPOS_TIP_ID = TIP_ID " +
                "WHERE USR_ID = ? " +
                "ORDER BY USR_NOME;" );

        stmt.setLong( 1, id );

        ResultSet rs = stmt.executeQuery();

        if ( rs.next() ) {

            usr = new Usuario();
            Tipo tip = new Tipo();

            usr.setId( rs.getInt( "USR_ID" ) );
            usr.setNome( rs.getString( "USR_NOME" ) );
            usr.setSenha( rs.getString("USR_SENHA") );
            usr.setEmail( rs.getString("USR_EMAIL") );
            usr.setMatricula( rs.getString("USR_MATRICULA") );

            tip.setId( rs.getInt( "TIP_ID" ));
            tip.setNome( rs.getString( "TIP_NOME" ));

            usr.setTipo( tip );

        }

        rs.close();
        stmt.close();

        return usr;

    }   
    
    public Usuario obterPorMatricula( String matricula ) throws SQLException {

        Usuario usr = null;

        PreparedStatement stmt = getConnection().prepareStatement(
                "SELECT * FROM usuarios " + 
                "INNER JOIN tipos ON FK_TIPOS_TIP_ID = TIP_ID " +
                "WHERE USR_MATRICULA = ? " +
                "ORDER BY USR_NOME;" );

        stmt.setString( 1, matricula );

        ResultSet rs = stmt.executeQuery();

        if ( rs.next() ) {

            usr = new Usuario();
            Tipo tip = new Tipo();

            usr.setId( rs.getInt( "USR_ID" ) );
            usr.setNome( rs.getString( "USR_NOME" ) );
            usr.setSenha( rs.getString("USR_SENHA") );
            usr.setEmail( rs.getString("USR_EMAIL") );
            usr.setMatricula( rs.getString("USR_MATRICULA") );

            tip.setId( rs.getInt( "TIP_ID" ));
            tip.setNome( rs.getString( "TIP_NOME" ));

            usr.setTipo( tip );

        }

        rs.close();
        stmt.close();

        return usr;

    }
}
