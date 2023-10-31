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
import chamaweb.entidades.Maquina;

public class MaquinaDAO extends DAO<Maquina> {

    public MaquinaDAO() throws SQLException {
    }
    
    @Override
    public void salvar( Maquina obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "INSERT INTO " + 
                "maquinas(MAQ_ID, MAQ_MARCA, MAQ_MODELO, MAQ_PROCESSADOR, MAQ_RAM, MAQ_OS, MAQ_ATIVO, FK_LABORATORIOS_LAB_ID) " + 
                "VALUES(?, ?, ?, ?, ?, ?, ?, ?);");

        stmt.setInt( 1, obj.getId() );
        stmt.setString( 2, obj.getMarca() );
        stmt.setString( 3, obj.getModelo() );
        stmt.setString( 4, obj.getProcessador() );
        stmt.setString( 5, obj.getRam() );
        stmt.setString( 6, obj.getOS() );
        stmt.setInt( 7, obj.getAtivo() );
        stmt.setInt( 8, obj.getLaboratorio().getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public void atualizar( Maquina obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "UPDATE maquinas " + 
                "SET" + 
                "    MAQ_MARCA = ?," + 
                "    MAQ_MODELO = ?," + 
                "    MAQ_PROCESSADOR = ?," + 
                "    MAQ_RAM = ?," + 
                "    MAQ_OS = ?," + 
                "    MAQ_ATIVO = ?," + 
                "    FK_LABORATORIOS_LAB_ID = ? " + 
                "WHERE" + 
                "    MAQ_ID = ?;" );

        stmt.setString( 1, obj.getMarca() );
        stmt.setString( 2, obj.getModelo() );
        stmt.setString( 3, obj.getProcessador() );
        stmt.setString( 4, obj.getRam() );
        stmt.setString( 5, obj.getOS() );
        stmt.setInt( 6, obj.getAtivo() );
        stmt.setInt( 7, obj.getLaboratorio().getId() );
        stmt.setInt( 8, obj.getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public void excluir( Maquina obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "DELETE FROM maquinas " + 
                "WHERE" + 
                "    MAQ_ID = ?;" );

        stmt.setInt( 1, obj.getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public List<Maquina> listarTodos() throws SQLException {

        List<Maquina> lista = new ArrayList<>();

        PreparedStatement stmt = getConnection().prepareStatement(
                "SELECT" + 
                "    * " + 
                "FROM" + 
                "    maquinas " +
                "INNER JOIN laboratorios ON laboratorios.LAB_ID = maquinas.FK_LABORATORIOS_LAB_ID " +
                "ORDER BY MAQ_ID;" );

        ResultSet rs = stmt.executeQuery();

        while ( rs.next() ) {

            Maquina maquina = new Maquina();
            Laboratorio laboratorio = new Laboratorio();

            maquina.setId( rs.getInt( "MAQ_ID" ) );
            maquina.setMarca( rs.getString( "MAQ_MARCA" ) );
            maquina.setModelo( rs.getString( "MAQ_MODELO" ) );
            maquina.setProcessador( rs.getString( "MAQ_PROCESSADOR" ) );
            maquina.setRam( rs.getString( "MAQ_RAM" ) );
            maquina.setOS( rs.getString( "MAQ_OS" ) );
            maquina.setAtivo( rs.getInt( "MAQ_ATIVO" ) );

            laboratorio.setId( rs.getInt( "LAB_ID" ) );
            laboratorio.setNome( rs.getString( "LAB_NOME" ) );
            laboratorio.setAtivo( rs.getInt( "LAB_ATIVO" ) );

            maquina.setLaboratorio( laboratorio );

            lista.add( maquina );

        }

        rs.close();
        stmt.close();

        return lista;

    }

    @Override
    public Maquina obterPorId(int id) throws SQLException {
        Maquina maquina = null;

        PreparedStatement stmt = getConnection().prepareStatement(
                "SELECT" + 
                "    * " + 
                "FROM" + 
                "    maquinas " +
                "INNER JOIN laboratorios ON laboratorios.LAB_ID = maquinas.FK_LABORATORIOS_LAB_ID " +
                "WHERE MAQ_ID = ? " +
                "ORDER BY MAQ_MARCA;"
        );

        stmt.setInt(1, id);

        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            maquina = new Maquina();
            Laboratorio laboratorio = new Laboratorio();

            laboratorio.setId(rs.getInt("LAB_ID"));
            laboratorio.setNome(rs.getString("LAB_NOME"));
            laboratorio.setAtivo(rs.getInt("LAB_ATIVO"));

            maquina.setId(rs.getInt("MAQ_ID"));
            maquina.setMarca(rs.getString("MAQ_MARCA"));
            maquina.setModelo(rs.getString("MAQ_MODELO"));
            maquina.setProcessador(rs.getString("MAQ_PROCESSADOR"));
            maquina.setRam(rs.getString("MAQ_RAM"));
            maquina.setOS(rs.getString("MAQ_OS"));
            maquina.setAtivo(rs.getInt("MAQ_ATIVO"));
            maquina.setLaboratorio(laboratorio);
        }

        rs.close();
        stmt.close();

        return maquina;
    }
}
