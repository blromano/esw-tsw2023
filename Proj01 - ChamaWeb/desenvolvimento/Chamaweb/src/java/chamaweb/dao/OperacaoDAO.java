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
import chamaweb.entidades.Operacao;
import chamaweb.entidades.Prioridade;
import chamaweb.entidades.Tipo;
import chamaweb.entidades.Usuario;

public class OperacaoDAO extends DAO<Operacao> {

    public OperacaoDAO() throws SQLException {
    }
    
    @Override
    public void salvar( Operacao obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "INSERT INTO " + 
                "operacoes(OPS_ID, OPS_DESCRICAO, FK_CHAMADOS_CHA_ID, FK_USUARIOS_USR_ID) " + 
                "VALUES(?, ?, ?, ?);");

        stmt.setInt( 1, obj.getId() );
        stmt.setString( 2, obj.getDescricao() );
        stmt.setInt( 3, obj.getChamado().getId() );
        stmt.setInt( 4, obj.getUsuario().getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public void atualizar( Operacao obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "UPDATE operacoes " + 
                "SET" + 
                "    OPS_DESCRICAO = ?," + 
                "    FK_CHAMADOS_CHA_ID = ?," + 
                "    FK_USUARIOS_USR_ID = ? " + 
                "WHERE" + 
                "    OPS_ID = ?;" );

        stmt.setString( 1, obj.getDescricao() );
        stmt.setInt( 2, obj.getChamado().getId() );
        stmt.setInt( 3, obj.getUsuario().getId() );
        stmt.setInt( 4, obj.getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public void excluir( Operacao obj ) throws SQLException {

        PreparedStatement stmt = getConnection().prepareStatement(
                "DELETE FROM operacoes " + 
                "WHERE" + 
                "    OPS_ID = ?;" );

        stmt.setInt( 1, obj.getId() );

        stmt.executeUpdate();
        stmt.close();

    }

    @Override
    public List<Operacao> listarTodos() throws SQLException {

        List<Operacao> lista = new ArrayList<>();

        PreparedStatement stmt = getConnection().prepareStatement(
                "SELECT" + 
                "    * " + 
                "FROM" + 
                "    operacoes " +
                "INNER JOIN chamados ON chamados.CHA_ID = operacoes.FK_CHAMADOS_CHA_ID " +
                "INNER JOIN usuarios ON usuarios.USR_ID = operacoes.FK_USUARIOS_USR_ID " +
                "ORDER BY OPS_ID;" );

        ResultSet rs = stmt.executeQuery();

        while ( rs.next() ) {
                
            Operacao operacao = new Operacao();
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
            maquina.setOS( rs.getString( "MAQ_OS" ) );
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

            operacao.setId(rs.getInt("OPS_ID"));
            operacao.setDescricao(rs.getString("OPS_DESCRICAO"));
            operacao.setChamado(chamado);
            operacao.setUsuario(tecnico);

            lista.add( operacao );    

        }

        rs.close();
        stmt.close();

        return lista;

    }

    @Override
    public Operacao obterPorId(int id) throws SQLException {
        Operacao operacao = null;

        PreparedStatement stmt = getConnection().prepareStatement(
                "SELECT" + 
                "    * " + 
                "FROM" + 
                "    operacoes " +
                "INNER JOIN chamados ON chamados.CHA_ID = operacoes.FK_CHAMADOS_CHA_ID " +
                "INNER JOIN maquinas ON maquinas.MAQ_ID = chamados.FK_MAQUINAS_MAQ_ID " +
                "INNER JOIN usuarios usuario ON usuarios.USR_ID = chamados.FK_USUARIOS_USR_ID " +
                "INNER JOIN usuarios tecnico ON usuarios.USR_ID = chamados.FK_USUARIOS_USR_ID_TECNICO " +
                "INNER JOIN categorias ON categorias.CAT_ID = chamados.FK_CATEGORIAS_CAT_ID " +
                "INNER JOIN prioridades ON prioridades.PRI_ID = chamados.FK_PRIORIDADES_PRI_ID " +
                "INNER JOIN estados ON estados.EST_ID = chamados.FK_ESTADOS_EST_ID " +
                "INNER JOIN laboratorios ON laboratorios.LAB_ID = maquinas.FK_LABORATORIOS_LAB_ID " +
                "INNER JOIN tipos tipoUsuario ON tipoUsuario.TIP_ID = usuario.FK_TIPOS_TIP_ID " +
                "INNER JOIN tipos tipoTecnico ON tipoTecnico.TIP_ID = tecnico.FK_TIPOS_TIP_ID " +
                "WHERE OPS_ID = ? " +
                "ORDER BY OPS_DESCRICAO;"
        );

        stmt.setInt(1, id);

        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            operacao = new Operacao();
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
            maquina.setOS( rs.getString( "MAQ_OS" ) );
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

            operacao.setId(rs.getInt("OPS_ID"));
            operacao.setDescricao(rs.getString("OPS_DESCRICAO"));
            operacao.setChamado(chamado);
            operacao.setUsuario(tecnico); //Técnico?
        }

        rs.close();
        stmt.close();

        return operacao;
    }
}
