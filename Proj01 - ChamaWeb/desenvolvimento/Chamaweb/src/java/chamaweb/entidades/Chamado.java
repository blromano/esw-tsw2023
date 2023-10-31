/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package chamaweb.entidades;

import java.sql.Date;


/**
 *
 * @author bv3008762 Victor Hugo
 */
public class Chamado {
    private int id;
    private String titulo;
    private Date data;
    private String descricao;
    private boolean resultadoAvaliacao;
    private String observacoesAvaliacao;
    
    private Usuario usuario;
    private Maquina maquina;
    private Usuario tecnico;
    private Categoria categoria;
    private Estado estado;
    private Prioridade prioridade;

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Maquina getMaquina() {
        return maquina;
    }

    public void setMaquina(Maquina maquina) {
        this.maquina = maquina;
    }

    public Usuario getTecnico() {
        return tecnico;
    }

    public void setTecnico(Usuario usuarioTecnico) {
        this.tecnico = usuarioTecnico;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public boolean getResultadoAvaliacao() {
        return resultadoAvaliacao;
    }

    public void setResultadoAvaliacao(boolean resultadoAvaliacao) {
        this.resultadoAvaliacao = resultadoAvaliacao;
    }

    public String getObservacoesAvaliacao() {
        return observacoesAvaliacao;
    }

    public void setObservacoesAvaliacao(String observacoesAvaliacao) {
        this.observacoesAvaliacao = observacoesAvaliacao;
    }

    public Prioridade getPrioridade() {
        return prioridade;
    }

    public void setPrioridade(Prioridade prioridade) {
        this.prioridade = prioridade;
    }

}
